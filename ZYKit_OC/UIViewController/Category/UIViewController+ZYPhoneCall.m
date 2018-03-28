//
//  UIViewController+ZYPhoneCall.m
//  ZYPhoneCall
//
//  Created by 杨志远 on 2017/12/24.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "UIViewController+ZYPhoneCall.h"

@implementation UIViewController (ZYPhoneCall)
-(void)zy_phoneCallWithPhoneNumber:(NSString *)phoneNumber {
    NSMutableString * phoneString = [[NSMutableString alloc] initWithFormat:@"tel:%@",phoneNumber];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:phoneString]]];
    [self.view addSubview:callWebview];
}
@end
