//
//  RootTabBarViewController.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/20.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "RootTabBarViewController.h"
// Controller
#import "UIUIViewController.h"

@interface Items : NSObject
@property(nonatomic,strong)UIImage  *itemImage;
@property(nonatomic,strong)UIImage  *itemSelectedImage;
@property(nonatomic,copy)NSString   *itemTitle;

-(instancetype)initWithTtemTitle:(NSString *)itemTitle itemImage:(UIImage *)itemImage itemSelectedImage:(UIImage *)itemSelectedImage;
@end

@implementation Items

-(instancetype)initWithTtemTitle:(NSString *)itemTitle itemImage:(UIImage *)itemImage itemSelectedImage:(UIImage *)itemSelectedImage {
    if (self = [super init]) {
        _itemTitle = itemTitle;
        _itemImage = itemImage;
        _itemSelectedImage = itemSelectedImage;
    }
    return self;
}

@end


@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController


-(instancetype)init {
    if (self = [super init]) {
        [self createRootViewController];
    }
    return self;
}

-(void)createRootViewController {
    NSArray <Items *>*items = [self createItems];
    
    NSArray <UIViewController *> *controllers = [self createControllers];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
    [items enumerateObjectsUsingBlock:^(Items * _Nonnull item, NSUInteger index, BOOL * _Nonnull stop) {
        UIViewController * vc = controllers[index];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.title = item.itemTitle;
        vc.tabBarItem.image = [item.itemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [item.itemSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [viewControllers addObject:nav];
    }];
    self.viewControllers = viewControllers;
}



-(NSArray<Items *> *)createItems {
    return @[
             [[Items alloc]initWithTtemTitle:@"UI" itemImage:[UIImage imageNamed:@"UI"] itemSelectedImage:[UIImage imageNamed:@"UI_S"]],
             [[Items alloc]initWithTtemTitle:@"NS" itemImage:[UIImage imageNamed:@"NS"] itemSelectedImage:[UIImage imageNamed:@"NS_S"]],
             [[Items alloc]initWithTtemTitle:@"Others" itemImage:[UIImage imageNamed:@"others"] itemSelectedImage:[UIImage imageNamed:@"others_s"]]
             ];
}


-(NSArray<UIViewController *>*)createControllers {
    return @[
             [[UIUIViewController alloc] init],
             [[UIUIViewController alloc] init],
             [[UIUIViewController alloc] init]
             ];
}

@end
