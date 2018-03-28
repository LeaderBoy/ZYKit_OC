//
//  UIUIViewController.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/20.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "UIUIViewController.h"
#import "TableViewItem.h"
#import "DisplayViewController.h"

#import "DataSource.h"
#import "UIDataSource.h"
#import "NSDataSource.h"
//
#import "ExpandButton.h"

//
#import "UIViewController+HideTabbar.h"

@interface UIUIViewController ()<UITableViewDelegate,ExpandButtonDelegate>
@property(nonatomic,strong)UITableView *iTableView;
@property(nonatomic,strong)DataSource *uiDataSource;
@end

@implementation UIUIViewController
{
    NSMutableArray *_stateArray;
    NSArray<TableViewItem *> *_dataSourceArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initial];
    [self createTableView];
}

-(void)initial {
    _uiDataSource = [[DataSource alloc]initWithDataSourceStyle:self.tabBarController.selectedIndex];
    _dataSourceArray = _uiDataSource.dataSourceArray;
    _stateArray = _uiDataSource.stateArray;
}

-(void)createTableView {
    _iTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _iTableView.delegate = self;
    _iTableView.dataSource = _uiDataSource;
    _iTableView.rowHeight = 44;
    _iTableView.sectionHeaderHeight = 44;
    _iTableView.tableFooterView = [UIView new];
    [self.view addSubview:_iTableView];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self buttonViewAtSection:section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DisplayViewController *display = [[DisplayViewController alloc]init];
    display.item = _dataSourceArray[indexPath.section];
    [self pushViewController:display animated:YES hideTabbarOnReturn:NO];
}
-(UIButton *)buttonViewAtSection:(NSInteger)section {
    ExpandButton *button = [[ExpandButton alloc] initWithSection:section sectionDataSource:_dataSourceArray sectionStateArray:_stateArray];
    button.delegate = self;
    return button;
}
#pragma mark - ExpandButtonDelegate
-(void)expanded:(UIButton *)sender {
    [_iTableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag-1] withRowAnimation:UITableViewRowAnimationFade];
}
@end
