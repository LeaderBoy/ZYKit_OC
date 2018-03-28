//
//  NSObject+EmptyObject.m
//  责任链模式
//
//  Created by 杨志远 on 17/6/6.
//  Copyright © 2017年 杨志远. All rights reserved.
//

#import "NSObject+EmptyObject.h"

@implementation NSObject (EmptyObject)
- (BOOL)isEmptyObject
{
    if ([self isEqual:[NSNull null]]) {
        return YES;
    }
    
    if ([self isKindOfClass:[NSString class]]) {
        if ([(NSString *)self length] == 0) {
            return YES;
        }
    }
    
    if ([self isKindOfClass:[NSArray class]]) {
        if ([(NSArray *)self count] == 0) {
            return YES;
        }
    }
    
    if ([self isKindOfClass:[NSDictionary class]]) {
        if ([(NSDictionary *)self count] == 0) {
            return YES;
        }
    }
    
    return NO;
}

@end
