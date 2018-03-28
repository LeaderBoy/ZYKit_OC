
#import "UINavigationBar+Height.h"
#import "objc/runtime.h"
static char const *const kHeightKey = "kHeightKey";

@implementation UINavigationBar (Height)

- (void)setHeight:(CGFloat)height
{
    objc_setAssociatedObject(self, kHeightKey, @(height), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)height
{
    return objc_getAssociatedObject(self, kHeightKey);
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize newSize;
    if (self.height) {
        newSize = CGSizeMake(self.superview.bounds.size.width, [self.height floatValue]);
    } else {
        newSize = [super sizeThatFits:size];
    }
    
    return newSize;
}


-(void)heightForNavigationBar:(CGFloat)height {
    if (@available(iOS 11.0,*)) {
        for (UIView *subview in self.subviews) {
            if ([NSStringFromClass([subview class]) containsString:@"BarBackground"]) {
                CGRect subViewFrame = subview.frame;
                subViewFrame.size.height = height;
                [subview setFrame: subViewFrame];
            }
        }
    }else{
        self.height = height;
    }
}
@end


/*
 
 for subview in (self.navigationController?.navigationBar.subviews)! {
 if NSStringFromClass(subview.classForCoder).contains("BarBackground") {
 var subViewFrame: CGRect = subview.frame
 // subViewFrame.origin.y = -20;
 subViewFrame.size.height = 100
 subview.frame = subViewFrame
 
 }
 
 }
 */
