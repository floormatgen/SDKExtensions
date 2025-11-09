#if canImport(UIKit)
import UIKit


extension NSLayoutConstraint {
    
    /// Activates all the constraints provided
    ///
    /// This is similar to `NSLayoutConstraint.activate(_:)`
    /// but without using an array
    ///
    /// - Parameter constraints: The constraints to activate
    ///
    @inlinable @inline(__always)
    @available(iOS 6.0, tvOS 9.0, visionOS 1.0, *)
    public static func activate<each C: NSLayoutConstraint>(_ constraints: repeat each C) {
        for c in repeat each constraints {
            c.isActive = true
        }
    }
    
    /// Deactivates all the constraints provided
    ///
    /// This is similar to `NSLayoutConstraint.deactivate(_:)`
    /// but without using an array.
    ///
    /// - Parameter constraints: The constraints to deactivate
    ///
    @inlinable @inline(__always)
    @available(iOS 6.0, tvOS 9.0, visionOS 1.0, *)
    public static func deactivate<each C: NSLayoutConstraint>(_ constraints: repeat each C) {
        for c in repeat each constraints {
            c.isActive = false
        }
    }
    
    /// Sets the priority of the constraint
    ///
    /// This is a convenience method to be used with `NSLayoutConstraint.activate(_:)`
    /// when priority doesn't need to be **required**.
    ///
    /// - Parameter priority: The priority to set for the constriant
    /// - Returns: The same constraint with the applied priority
    ///
    @available(iOS 6.0, tvOS 9.0, visionOS 1.0, *) @inlinable @discardableResult
    public func withPriority(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }
    
}

#endif // canImport(UIKit)
