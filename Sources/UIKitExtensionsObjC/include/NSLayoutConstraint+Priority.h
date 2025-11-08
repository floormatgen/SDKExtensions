#if __has_include(<UIKit/NSLayoutConstraint.h>)

#ifdef __cplusplus
extern "C" {
#endif

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutConstraint (Priority)

/// Sets the priority of the constraint
///
/// This is a convenience method to be used with `NSLayoutConstraint.activate(_:)`
/// when priority doesn't need to be **required**.
///
/// - Parameter priority: The priority to set for the constriant
/// - Returns: The same constraint with the applied priority
- (instancetype)withPriority:(UILayoutPriority)priority;

@end

NS_ASSUME_NONNULL_END

#ifdef __cplusplus
}
#endif

#endif // __has_include(<UIKit/NSLayoutConstraint.h>)
