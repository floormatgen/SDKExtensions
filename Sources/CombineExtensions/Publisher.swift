#if canImport(Combine)
import Combine


@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, visionOS 1.0, *)
extension Publisher {
    
    /// Assigns to an object without a strong reference
    ///
    /// This works similar to `Publisher.assign(to:on:)` but without
    /// maintaining a strong reference to it.
    ///
    /// - Parameter keyPath:
    ///     The keyPath to assign on.
    /// - Parameter object:
    ///     The object to assign to. This will be used as the root for `keyPath`.
    ///
    @inlinable
    public func weakAssign<Root: AnyObject>(
        to keyPath: ReferenceWritableKeyPath<Root, Self.Output>,
        on object: Root
    ) -> AnyCancellable
    where Self.Failure == Never {
        self.sink { [weak object] output in
            object?[keyPath: keyPath] = output
        }
    }
    
}

#endif // canImport(Combine)
