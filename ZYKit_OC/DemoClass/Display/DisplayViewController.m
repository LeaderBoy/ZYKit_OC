//
//  DisplayViewController.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/21.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "DisplayViewController.h"
#import "DisplayCell.h"

// UIBarButtonItem
#import "UIBarButtonItem+Badge.h"
// UINavigationBar
#import "UINavigationBar+Height.h"
#import "UINavigationBar+Translucent.h"

@interface DisplayViewController ()<UITableViewDelegate,UITableViewDataSource,DisplayCellDelegate>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.item.sectionTitle;
    [self createTableView];
}

-(void)createTableView {
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 222;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.item.contents.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DisplayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DisplayCellIdentifier"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"DisplayCell" owner:self options:nil].lastObject;
        
    }
    cell.delegate = self;
    
    [cell configueWithItemClass:self.item.sectionTitle itemTitle:self.item.contents[indexPath.row]];
    return cell;
}

#pragma mark - DisplayCellDelegate
-(void)barButtonItem_badge {
    UIImage *image = [UIImage imageNamed:@"NS"];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:button];
    right.badgeValue = @"2";
    self.navigationItem.rightBarButtonItem = right;
}

-(void)navigationBar_height {
    // 在viewDidAppear
//    -(void)viewDidAppear:(BOOL)animated {
//        [self.navigationController.navigationBar heightForNavigationBar:100];
//    }
}

-(void)navigationBar_translucent {
    [self.navigationController.navigationBar translucentNavigationBar];
}

-(void)dealloc {
    NSLog(@"销毁了");
}







@end
