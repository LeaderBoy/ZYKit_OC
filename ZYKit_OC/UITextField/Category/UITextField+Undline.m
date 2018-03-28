//
//  UITextField+Undline.m
//  Shoppix
//
//  Created by 杨志远 on 2017/10/10.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "UITextField+Undline.h"
#import <objc/runtime.h>

static NSString *const kUndineColorKey = @"kUndineColorKey";
@implementation UITextField (Undline)

-(void)setUndlineColor:(UIColor *)undlineColor {
    objc_setAssociatedObject(self, &kUndineColorKey, undlineColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.shadowColor = undlineColor.CGColor;

}

-(UIColor *)undlineColor {
    return (UIColor *)objc_getAssociatedObject(self, &kUndineColorKey);
}

-(void)zy_enableUndline {
    self.borderStyle = UITextBorderStyleNone;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    if (self.superview && self.superview.backgroundColor) {
        self.layer.backgroundColor = self.superview.backgroundColor.CGColor;
    }else{
        self.layer.backgroundColor = [UIColor whiteColor].CGColor;
    }
    self.layer.borderWidth = 0.0;
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowRadius = 0.0;
}
@end
