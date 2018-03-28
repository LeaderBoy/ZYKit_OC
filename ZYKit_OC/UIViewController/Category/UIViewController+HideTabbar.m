//
//  UIViewController+HideTabbar.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/26.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "UIViewController+HideTabbar.h"

@implementation UIViewController (HideTabbar)
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated hideTabbarOnReturn:(BOOL)hide {
    if (self.navigationController) {
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:animated];
        self.hidesBottomBarWhenPushed = hide;
    }else{
        NSLog(@"navigationController不存在");
    }
}
@end
