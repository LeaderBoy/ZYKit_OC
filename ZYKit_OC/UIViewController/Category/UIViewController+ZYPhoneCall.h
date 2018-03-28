//
//  UIViewController+ZYPhoneCall.h
//  ZYPhoneCall
//
//  Created by 杨志远 on 2017/12/24.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZYPhoneCall)

/**
 调用打电话

 @param phoneNumber 电话号码
 */
-(void)zy_phoneCallWithPhoneNumber:(NSString *)phoneNumber;

@end
