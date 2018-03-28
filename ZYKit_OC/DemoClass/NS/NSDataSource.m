//
//  NSDataSource.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/26.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "NSDataSource.h"

@implementation NSDataSource
-(instancetype)init {
    self = [super init];
    if (self) {
        [self initial];
    }
    return self;
}

-(void)initial {
    self.dataSourceArray = @[
                             [self createNSObjectItems],
                             [self createNSDateItems],
                             [self createNSDictionaryItems],
                             [self createNSArrayItems],
                             [self createNSStringItems],
                             [self createNSTimerItems]
                             ];
    self.stateArray = [NSMutableArray array];
    
    for (int i = 0; i < self.dataSourceArray.count; i++) {
        [self.stateArray addObject:@"0"];
    }
}

#pragma mark - NSObject
-(TableViewItem *)createNSObjectItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"NSObject" contents:@[@"NSObject+EmptyObject",@"NSObject+Swizzling",@"NSObject+NetworkReachable",@"NSObject+RequestImageAuthorization"]];
}
#pragma mark - NSDate
-(TableViewItem *)createNSDateItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"NSDate" contents:@[@"NSDate+Escort"]];
}

#pragma mark - NSDictionary
-(TableViewItem *)createNSDictionaryItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"NSDictionary" contents:@[@"NSDictionary+Log"]];
}

#pragma mark - NSArray
-(TableViewItem *)createNSArrayItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"NSArray" contents:@[@"NSArray+Log"]];
}

#pragma mark - NSString
-(TableViewItem *)createNSStringItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"NSString" contents:@[@"NSString+UTF8",@"NSString+Scanner",@"NSString+ZYStringToColor"]];
}
#pragma mark - NSTimer
-(TableViewItem *)createNSTimerItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"NSTimer" contents:@[@"NSTimer+ZYTimer"]];
}
@end
