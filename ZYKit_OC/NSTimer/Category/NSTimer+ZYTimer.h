//
//  NSTimer+ZYTimer.h
//  ZYTimer
//
//  Created by 杨志远 on 2017/12/24.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (ZYTimer)

/**
 此函数是为了防止timer没有释放的情况 
 在iOS10及以后已经有替代者
 使用实例:
 __weak typeof(self)weakSelf = self;
 _timer = [NSTimer zy_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
 __strong typeof(self)strongSelf = weakSelf;
 [strongSelf excuteFoo];
 } repeats:YES];
 
 
 @param ti 时间
 @param block block
 @param repeats 是否重复
 @return timer
 */
+(NSTimer *)zy_scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;
@end
