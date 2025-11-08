#if __has_include(<UIKit/NSLayoutConstraint.h>)

#import "include/NSLayoutConstraint+Priority.h"

#ifdef __cplusplus
extern "C" {
#endif

@implementation NSLayoutConstraint (Priority)

- (instancetype)withPriority:(UILayoutPriority)priority {
    self.priority = priority;
    return self;
}

@end

#ifdef __cplusplus
}
#endif

#endif // __has_include(<UIKit/NSLayoutConstraint.h>)
