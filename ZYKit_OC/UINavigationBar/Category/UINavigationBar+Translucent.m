//
//  UINavigationBar+Translucent.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/22.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "UINavigationBar+Translucent.h"

@implementation UINavigationBar (Translucent)
-(void)translucentNavigationBar {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), NO, self.layer.contentsScale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *color = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.87];
    CGContextSetFillColorWithColor(context, color.CGColor);
    UIRectFill(CGRectMake(0, 0, 1, 1));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}
@end
