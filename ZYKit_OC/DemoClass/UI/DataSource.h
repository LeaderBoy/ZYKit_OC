//
//  DataSource.h
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/26.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewItem.h"


typedef enum : NSUInteger {
    DataSourceStyleUI,
    DataSourceStyleNS,
    DataSourceStyleOthers,
} DataSourceStyle;
@interface DataSource : NSObject<UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *stateArray;
@property(nonatomic,strong)NSArray<TableViewItem *> *dataSourceArray;

-(instancetype)initWithDataSourceStyle:(DataSourceStyle)dataSourceStyle;
@end
