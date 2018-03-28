//
//  NSDictionary+Log.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/26.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "NSDictionary+Log.h"

//@implementation NSDictionary (Log)
//#if DEBUG
//- (NSString *)descriptionWithLocale:(nullable id)locale{
//    NSString *log;
//    @try {
//
//        log = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
//
//    } @catch (NSException *exception) {
//
//        NSString *reason = [NSString stringWithFormat:@"reason:%@",exception.reason];
//        log = [NSString stringWithFormat:@"转换失败:\n%@,\n转换终止,输出如下:\n%@",reason,self.description];
//
//    } @finally {
//
//    }
//    return log;
//}
//#endif
//@end



@implementation NSDictionary (Log)
#if DEBUG
-(NSString *)description {
    NSMutableString *str = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [str appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [str appendString:@"}\n"];
    
    return str;
}
#endif
@end
