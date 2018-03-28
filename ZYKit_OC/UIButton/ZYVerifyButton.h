//
//  ZYVerifyButton.h
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/22.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//



/*
 请使用+(instancetype)buttonWithType:(UIButtonType)buttonType方法创建并且
 使用UIButtonTypeCustom类型 避免按钮标题闪动的bug
 */

#import <UIKit/UIKit.h>
typedef void(^RequestVerify)(void);
typedef void(^RequestVerifyTimeOff)(void);

@interface ZYVerifyButton : UIButton

/**
 点击事件回调
 */
@property(nonatomic,copy)RequestVerify verifyCall;

/**
 请求超时的回调
 */
@property(nonatomic,copy)RequestVerifyTimeOff verifyTimeOff;

/**
 超时时间
 */
@property(nonatomic,assign)int timeOut;

/**
 按钮enable状态时候的颜色
 */
@property(nonatomic,strong)UIColor *enableColor;

/**
 按钮!enable状态时候的颜色
 */
@property(nonatomic,strong)UIColor *unEnableColor;


/**
 点击之前的按钮标题
 */
@property(nonatomic,copy)NSString *verifyTitle;

/**
 点击之后按钮的标题
 */
@property(nonatomic,copy)NSString *verifyingTitle;


/**
 重置按钮的状态
 */
-(void)resetTime;
@end
