//
//  ExpandButton.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/26.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "ExpandButton.h"
@interface ExpandButton()
@property(nonatomic,assign)NSInteger section;
@property(nonatomic,copy)NSString *sectionTitle;
@property(nonatomic,copy)NSString *sectionState;

@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *sectionTitleLabel;

@property(nonatomic,strong)NSArray<TableViewItem *> *sectionDataSource;
@property(nonatomic,strong)NSMutableArray *sectionStateArray;

@end
@implementation ExpandButton

-(instancetype)initWithSection:(NSInteger)section sectionDataSource:(NSArray<TableViewItem *> *)sectionDataSource sectionStateArray:(NSMutableArray *)sectionStateArray {
    if (self = [super init]) {
        _section = section;
        _sectionTitle = sectionDataSource[section].sectionTitle;
        _sectionState = sectionStateArray[section];
        
        _sectionDataSource = sectionDataSource;
        _sectionStateArray = sectionStateArray;
        [self expandButton];
    }
    return self;
}

-(void)expandIcon {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 10, 6)];
    if ([_sectionState isEqualToString:@"0"]) {
        imageView.image = [UIImage imageNamed:@"ico_listdown"];
    }else{
        imageView.image = [UIImage imageNamed:@"ico_listup"];
    }
    _iconImageView = imageView;
    [self addSubview:_iconImageView];
}

-(void)expandTitle {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 20)];
    label.font = [UIFont boldSystemFontOfSize:19];
    label.text = _sectionTitle;
    [self addSubview:label];
    _sectionTitleLabel = label;
}

-(void)expandButton {
    [self expandIcon];
    [self expandTitle];
    self.backgroundColor = [UIColor whiteColor];
    self.tag = _section + 1;
    [self addTarget:self action:@selector(expandButtonTap:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)expandButtonTap:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(expanded:)]) {
        
        if ([_sectionStateArray[sender.tag - 1] isEqualToString:@"1"]){
            [_sectionStateArray replaceObjectAtIndex:sender.tag - 1 withObject:@"0"];
        }else{
            [_sectionStateArray replaceObjectAtIndex:sender.tag - 1 withObject:@"1"];
        }
        
        [self.delegate expanded:sender];
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = self.frame;
    CGRect iconFrame =  _iconImageView.frame;
    CGRect labelFrame =  _sectionTitleLabel.frame;

    
    iconFrame.origin.x = frame.size.width - 30;
    iconFrame.origin.y = (frame.size.height - 6) / 2;
    _iconImageView.frame = iconFrame;
    
    labelFrame.origin.x = 15;
    labelFrame.origin.y = (frame.size.height - 20) / 2;
    _sectionTitleLabel.frame = labelFrame;
}
@end
