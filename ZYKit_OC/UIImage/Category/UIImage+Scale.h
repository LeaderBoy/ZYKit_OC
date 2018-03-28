//
//  UIImage+Scale.h
//  ATTENCE
//
//  Created by 杨志远 on 17/5/26.
//  Copyright © 2017年 css.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

/**
 缩放image到指定的size

 @param size 指定的size
 @return image
 */
- (UIImage *)scaleToSize:(CGSize)size;
@end
