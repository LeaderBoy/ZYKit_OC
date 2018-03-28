//
//  Macros.h
//  Shoppix
//
//  Created by 杨志远 on 2017/10/10.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#ifndef Macros_h
#define Macros_h


/**
 DEBUG 打印
 */
#ifdef DEBUG
# define DLog(format, ...) NSLog((@"\n文件名:%s \n" "函数名:%s \n" "行号:%d \n" format), (strrchr(__FILE__, '/') ?: __FILE__ - 1) + 1, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif

/**
 颜色宏定义
 */
#define COLOR(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]



/**
 禁用系统的自动调整行为
 
 @param scrollView 滚动视图  iOS11上使用
 @param vc ViewController iOS11 之前使用
 @return
 */
#define  NotAdjustsScrollViewInsetsFor(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)





/**
 *  使用Single(name)  代替 + (instancetype)shared##name;
 *
 *  ## 在头文件的作用是拼接字符串
 */
#define Single(name) + (instancetype)shared##name;

/*
 使用方法
 @interface BtmAcount : NSObject
 Single(BtmAcount)
 @end
 
 @implementation BtmAcount
 Singleton(BtmAcount)
 @end
 */

#if __has_feature(objc_arc)
// ARC模式
#define Singleton(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
}

#else
// 非ARC模式
#define Singleton(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
} \
\
- (oneway void)release { } \
- (id)retain { return self; } \
- (NSUInteger)retainCount { return 1;} \
- (id)autorelease { return self;}

#endif


#endif /* Macros_h */
