//
//  TableViewItem.h
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/20.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewItem : NSObject
@property(nonatomic,copy)NSString *sectionTitle;
@property(nonatomic,copy)NSArray *contents;

-(instancetype)initWithSectionTitle:(NSString *)sectionTitle contents:(NSArray *)contents;
@end
