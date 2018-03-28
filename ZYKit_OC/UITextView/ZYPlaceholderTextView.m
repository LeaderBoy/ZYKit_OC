//
//  ZYPlaceholderTextView.m
//  ZYPlaceholderTextView
//
//  Created by 杨志远 on 2017/12/24.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYPlaceholderTextView.h"
@interface ZYPlaceholderTextView()
@property(nonatomic,strong)UILabel *placeholderLabel;
@end

@implementation ZYPlaceholderTextView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame: frame])
    {
        [self setUp];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}

-(void)setUp
{
    self.font = [UIFont systemFontOfSize:17];
    self.placeholderColor = [UIColor grayColor];
    [self addSubview:self.placeholderLabel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification) name:UITextViewTextDidChangeNotification object:nil];
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

-(UILabel *)placeholderLabel
{
    if (!_placeholderLabel)
    {
        _placeholderLabel = [[UILabel alloc]init];
        _placeholderLabel.numberOfLines = 0;
        [self.placeholderLabel sizeToFit];
    }
    return _placeholderLabel;
}


-(void)textDidChangeNotification
{
    self.placeholderLabel.hidden = self.hasText;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.placeholderLabel.frame = CGRectMake(6, 7, self.frame.size.width - 2*6, 0);
    [self.placeholderLabel sizeToFit];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

@end
