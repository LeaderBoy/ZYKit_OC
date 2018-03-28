//
//  AppDelegate+RootTabBarViewController.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/20.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "AppDelegate+RootTabBarViewController.h"
#import "RootTabBarViewController.h"
@implementation AppDelegate (RootTabBarViewController)
-(void)root_initial {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[RootTabBarViewController alloc] init];
    [self.window makeKeyAndVisible];
}
@end
