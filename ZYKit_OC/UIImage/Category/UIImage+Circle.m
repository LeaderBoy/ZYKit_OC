//
//  UIImage+Circle.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/19.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "UIImage+Circle.h"

@implementation UIImage (Circle)

-(UIImage *)circleImage {
    return [self circleImageToInset:0];
}

-(UIImage *)circleImageToInset:(CGFloat)inset {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0);
    CGRect rect = CGRectZero;
    if (self.size.width < inset || self.size.height < inset) {
        
    }else{
        rect = CGRectMake(inset, inset, self.size.width - inset * 2.0f, self.size.width - inset * 2.0f);
    }
    
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [self drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImg;
}


@end
