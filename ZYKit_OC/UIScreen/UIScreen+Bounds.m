//
//  UIScreen+Bounds.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/28.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "UIScreen+Bounds.h"

@implementation UIScreen (Bounds)
+(CGFloat)screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+(CGFloat)screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}
@end
