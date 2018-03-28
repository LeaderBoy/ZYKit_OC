//
//  UIImage+Position.m
//  Shoppix
//
//  Created by 杨志远 on 2017/8/10.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "UIImage+Position.h"

@implementation UIImage (Position)

-(UIImage *)positionOffsetXWithPt:(CGFloat)pt {
    UIImage *image = self;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width + pt, image.size.height), NO, [UIScreen mainScreen].scale);
    [image drawAtPoint:CGPointMake(pt, 0)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}


@end
