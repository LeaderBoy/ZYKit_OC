//
//  UIImage+Circle.h
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/19.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Circle)

/**
 给图形添加圆角

 @return image
 */
-(UIImage*)circleImage;

/**
 给图形添加圆角

 @param inset inset 越大图越小
 @return image
 */
-(UIImage*)circleImageToInset:(CGFloat)inset;
@end
