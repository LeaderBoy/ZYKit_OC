//
//  ExpandButton.h
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/26.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewItem.h"
@protocol ExpandButtonDelegate<NSObject>
-(void)expanded:(UIButton *)sender;
@end
@interface ExpandButton : UIButton
@property(nonatomic,weak)id<ExpandButtonDelegate>delegate;

-(instancetype)initWithSection:(NSInteger)section sectionDataSource:(NSArray<TableViewItem *> *)sectionDataSource sectionStateArray:(NSMutableArray *)sectionStateArray;

@end
