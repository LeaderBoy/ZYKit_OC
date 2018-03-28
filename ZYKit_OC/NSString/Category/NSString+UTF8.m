//
//  NSString+UTF8.m
//  ATTENCE
//
//  Created by 杨志远 on 17/5/24.
//  Copyright © 2017年 css.com.cn. All rights reserved.
//

#import "NSString+UTF8.h"

@implementation NSString (UTF8)


-(NSString *)zy_toUTF8 {
    
    if (@available(iOS 9.0,*)) {
        return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    //过期的方法
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
#pragma clang diagnostic pop
}

-(NSString *)zy_toString {
    if (@available(iOS 9.0,*)) {
        return [self stringByRemovingPercentEncoding];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    //过期的方法
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
#pragma clang diagnostic pop
}
@end
