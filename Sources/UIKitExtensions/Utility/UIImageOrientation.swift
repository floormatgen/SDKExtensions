#if canImport(UIKit)
import UIKit


extension UIImage.Orientation {
    
    /// Gets the degrees of the image orientation
    ///
    /// This property treats flipped orientations and regular orientations as the same.
    ///
    /// > Important:
    /// > This property returns `CGFloat.nan` for `UIImage.Orientations` it doesn't recognize,
    /// > like those added in future versions.
    @inlinable
    public var degrees: CGFloat {
        return switch self {
        case .up,       .upMirrored:    0
        case .down,     .downMirrored:  180
        case .right,    .rightMirrored: 90
        case .left,     .leftMirrored:  -90
        @unknown default: CGFloat.nan
        }
    }

    /// Gets the radians of the image orientation
    @inlinable
    public var radians: CGFloat {
        return degrees * (.pi / 180)
    }
    
    /// Whether the orientation represents a mirrored orientation
    @inlinable
    public var isMirrored: Bool {
        return switch self {
        case .upMirrored,   .downMirrored,  .rightMirrored, .leftMirrored:  true
        case .up,           .down,          .right,         .left:          false
        @unknown default: false
        }
    }
    
    /// Creates a new orientation from an angle
    ///
    /// If the angle is not a multiple of `90`, `nil` is returned.
    ///
    /// - Parameter degrees: The angle
    ///
    @inlinable
    public init?<T: FloatingPoint>(degrees: T) {
        var angle = degrees.truncatingRemainder(dividingBy: 360)
        if angle > 180 { angle -= 360 }
        
        switch angle {
        case 0: self = .up
        case 180: self = .down
        case 90: self = .right
        case -90: self = .left
        default: return nil
        }
        
    }
    
}

#endif // canImport(UIKit)
