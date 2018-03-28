//
//  NSTimer+ZYTimer.m
//  ZYTimer
//
//  Created by 杨志远 on 2017/12/24.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "NSTimer+ZYTimer.h"
#import <UIKit/UIKit.h>

@implementation NSTimer (ZYTimer)

+(NSTimer *)zy_scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)repeats {
    if (@available(iOS 10.0, *)) {
        return [self scheduledTimerWithTimeInterval:ti repeats:repeats block:block];
    } else {
        return [self scheduledTimerWithTimeInterval:ti target:self selector:@selector(zy_blockInvoke:) userInfo:[block copy] repeats:repeats];
    }
}

+(void)zy_blockInvoke:(NSTimer *)timer {
    void(^block)(NSTimer *) = timer.userInfo;
    if (block) {
        block(timer);
    }
}


@end
