//
//  NSObject+EmptyObject.h
//  责任链模式
//
//  Created by 杨志远 on 17/6/6.
//  Copyright © 2017年 杨志远. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (EmptyObject)

/**
 判断是否是空对象

 @return bool
 */
- (BOOL)isEmptyObject;
@end
