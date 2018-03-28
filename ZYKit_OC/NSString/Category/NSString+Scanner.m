//
//  NSString+Scanner.m
//  判断输入的是否是纯数字等
//
//  Created by 杨志远 on 2017/10/10.
//  Copyright © 2017年 杨志远. All rights reserved.
//

#import "NSString+Scanner.h"

@implementation NSString (Scanner)
#pragma mark --判断字符串里的数是否是int类型
-(BOOL)zy_isPureInt
{//还有double float等类型
    NSScanner *scanner = [NSScanner scannerWithString:self];
    int val;
    return  [scanner scanInt:&val] && [scanner isAtEnd];
}
@end
