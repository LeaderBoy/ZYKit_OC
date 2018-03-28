//
//  NSArray+Log.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/28.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)
#if DEBUG
-(NSString *)description {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return nil;
}
#endif


@end
