//
//  UIImage+Position.h
//  Shoppix
//
//  Created by 杨志远 on 2017/8/10.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Position)

/**
 调整图片的X的偏移量 即给图片增加x的宽度的空白

 @param pt x偏移量
 @return image
 */
-(UIImage *)positionOffsetXWithPt:(CGFloat)pt;
@end
