//
//  DataSource.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/26.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "DataSource.h"
#import "UIDataSource.h"
#import "NSDataSource.h"
@implementation DataSource

-(instancetype)initWithDataSourceStyle:(DataSourceStyle)dataSourceStyle {
    self = [super init];
    if (self) {
        switch (dataSourceStyle) {
            case DataSourceStyleUI:
                return [[UIDataSource alloc] init];
                break;
            case DataSourceStyleNS:
                return [[NSDataSource alloc] init];
                break;
            case DataSourceStyleOthers:
                return [[NSDataSource alloc] init];
                break;
        }
    }
    return self;
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([_stateArray[section] isEqualToString:@"1"]) {
        return _dataSourceArray[section].contents.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_reuseIdentifier"];
    cell.textLabel.text = _dataSourceArray[indexPath.section].contents[indexPath.row];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSourceArray.count;
}
@end
