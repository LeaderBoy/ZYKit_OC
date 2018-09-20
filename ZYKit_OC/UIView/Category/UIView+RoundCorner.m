//
//  UIView+RoundCorner.m
//  Test2
//
//  Created by 杨志远 on 2018/9/20.
//  Copyright © 2018 BaQiWL. All rights reserved.
//

#import "UIView+RoundCorner.h"

@implementation UIView (RoundCorner)
-(void)roundCorner:(UIRectCorner)rectCorner  cornerRadii:(CGSize)cornerRadii {
    CGRect rect = self.bounds;
    UIBezierPath *bezPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:rectCorner cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    maskLayer.path  = bezPath.CGPath;
    self.layer.mask = maskLayer;
}
@end
