//
//  UITextField+Undline.h
//  Shoppix
//
//  Created by 杨志远 on 2017/10/10.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 支持下划线的UITextField
 */
@interface UITextField (Undline)

/**
 下划线的颜色  Default is lightGrayColor
 */
@property(nonatomic,strong)UIColor *undlineColor;



/**
 支持undline
 注:textField.layer.backgroundColor和父视图的背景颜色一致 如果没有获取到父视图背景色,则取白色为layer的背景色,也是就是说textField.layer.backgroundColor一定要有值才会显示出下划线
 
 */
-(void)zy_enableUndline;
@end
