//
//  UnderLineTextField.m
//  Shoppix
//
//  Created by 杨志远 on 2017/9/18.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "UnderLineTextField.h"

@implementation UnderLineTextField

-(instancetype)init {
    self = [super init];
    if (self) {
        _isEnableLeftViewM = YES;
        [self setUp];
    }
    return self;
}

-(void)drawRect:(CGRect)rect {
    
    CGPoint startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    path.lineWidth = 2;
    [self.tintColor setStroke];
    [path stroke];
}

-(void)setTintColor:(UIColor *)tintColor {
    [super setTintColor:tintColor];
    [self setNeedsDisplay];
}

-(void)setUp {
    self.tintColor = [UIColor lightGrayColor];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
}


- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    if (!_isEnableLeftViewM) {
        return [super leftViewRectForBounds:bounds];
    }
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 5; //像右边偏5
    return iconRect;
}

//UITextField 文字与输入框的距离
- (CGRect)textRectForBounds:(CGRect)bounds{
    if (!_isEnableLeftViewM) {
        return [super textRectForBounds:bounds];
    }
    return CGRectInset(bounds, 35, 0);
    
}

//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    if (!_isEnableLeftViewM) {
        return [super editingRectForBounds:bounds];
    }
    return CGRectInset(bounds, 35, 0);
}



@end
