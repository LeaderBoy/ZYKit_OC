//
//  UIImage+Scale.m
//  ATTENCE
//
//  Created by 杨志远 on 17/5/26.
//  Copyright © 2017年 css.com.cn. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)



- (UIImage *)scaleToSize:(CGSize)size{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
