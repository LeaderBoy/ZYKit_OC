//
//  NSString+UTF8.h
//  ATTENCE
//
//  Created by 杨志远 on 17/5/24.
//  Copyright © 2017年 css.com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UTF8)


/**
 编码

 @return 编码后的字符串
 */
-(NSString *)zy_toUTF8;

/**
 解码

 @return 解码后的字符串
 */
-(NSString *)zy_toString;
@end
