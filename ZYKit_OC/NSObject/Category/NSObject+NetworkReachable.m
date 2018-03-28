//
//  NSObject+NetworkReachable.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/19.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "NSObject+NetworkReachable.h"
#import <SystemConfiguration/SCNetworkReachability.h>

@implementation NSObject (NetworkReachable)
-(BOOL)zy_isNetworkReachable {
    SCNetworkReachabilityFlags flags;
    SCNetworkReachabilityRef address;
    address = SCNetworkReachabilityCreateWithName(NULL, "www.baidu.com" );
    Boolean success = SCNetworkReachabilityGetFlags(address, &flags);
    CFRelease(address);
    
    bool canReach = success
    && !(flags & kSCNetworkReachabilityFlagsConnectionRequired)
    && (flags & kSCNetworkReachabilityFlagsReachable);
    
    return canReach;
}
@end
