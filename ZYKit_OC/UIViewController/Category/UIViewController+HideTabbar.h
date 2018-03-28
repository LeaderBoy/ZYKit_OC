//
//  UIViewController+HideTabbar.h
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/26.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HideTabbar)
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated hideTabbarOnReturn:(BOOL)hide;
@end
