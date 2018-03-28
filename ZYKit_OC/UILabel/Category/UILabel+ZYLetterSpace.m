//
//  UILabel+ZYLetterSpace.m
//  ceshi
//
//  Created by 杨志远 on 2017/12/24.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "UILabel+ZYLetterSpace.h"

@implementation UILabel (ZYLetterSpace)


-(NSDictionary *)zy_addAttributesWithSpace:(CGFloat)space {
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];

    attributes[NSKernAttributeName] = @(space);
    attributes[NSParagraphStyleAttributeName] = paragraphStyle;
    return [attributes copy];
}

-(void)zy_addLetterSpace:(CGFloat)space {

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:[self zy_addAttributesWithSpace:space]];
    
    self.attributedText = attributedString;
}
@end
