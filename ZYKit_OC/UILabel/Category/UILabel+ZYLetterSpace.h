//
//  UILabel+ZYLetterSpace.h
//  ceshi
//
//  Created by 杨志远 on 2017/12/24.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZYLetterSpace)

/**
 增加文字间距
 说明:需要在赋值文字后使用
 @param space 间距
 */
-(void)zy_addLetterSpace:(CGFloat)space;

/**
 增加文字间距的attributes
 说明:当已经有了其他的attributes的时候为了不覆盖其他的attributes 只需要在原来的基础上增加attributes
 @param space 间距
 @return attributes
 */
-(NSDictionary *)zy_addAttributesWithSpace:(CGFloat)space;
@end
