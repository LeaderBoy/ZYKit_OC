//
//  TableViewItem.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/20.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "TableViewItem.h"

@implementation TableViewItem
-(instancetype)initWithSectionTitle:(NSString *)sectionTitle contents:(NSArray *)contents {
    if (self = [super init]) {
        _sectionTitle = sectionTitle;
        _contents = contents;
    }
    return self;
}
@end
