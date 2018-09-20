//
//  UIDataSource.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/22.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "UIDataSource.h"

@implementation UIDataSource

-(instancetype)init {
    self = [super init];
    if (self) {
        [self initial];
    }
    return self;
}

-(void)initial {
    self.dataSourceArray = @[
                             [self createUIScreenItems],
                             [self createUIViewItems],
                         [self createUIImageItems],
                         [self createUIColorItems],
                         [self createUIButtonItems],
                         [self createUILabelItems],
                         [self createUITextViewItems],
                         [self createUITextFieldItems],
                         [self createUIBarButtonItemItems],
                         [self createUINavigationBarItems],
                         [self createUIViewControllerItems],
                         [self createUIActivityIndicatorViewItems]];
    self.stateArray = [NSMutableArray array];
    
    for (int i = 0; i < self.dataSourceArray.count; i++) {
        [self.stateArray addObject:@"0"];
    }
}

#pragma mark - UIScreen
-(TableViewItem *)createUIScreenItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UIScreen" contents:@[@"UIScreen+Bounds"]];
}

#pragma mark - UIView
-(TableViewItem *)createUIViewItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UIView" contents:@[@"UIView+Bounds",@"UIView+RoundCorner"]];
}
#pragma mark - UIImage
-(TableViewItem *)createUIImageItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UIImage" contents:@[@"UIImage+Scale",@"UIImage+Circle",@"UIImage+Position",@"UIImage+Blur"]];
}
#pragma mark - UIColor

-(TableViewItem *)createUIColorItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UIColor" contents:@[@"UIColor+ZYColorToString",@"UIColor+Hex"]];
}
#pragma mark - UIButton
-(TableViewItem *)createUIButtonItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UIButton" contents:@[@"UIButton+Badge",@"ZYVerifyButton"]];
}
#pragma mark - UILabel

-(TableViewItem *)createUILabelItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UILabel" contents:@[@"UILabel+ZYLetterSpace"]];
}
#pragma mark - UITextView

-(TableViewItem *)createUITextViewItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UITextView" contents:@[@"ZYPlaceholderTextView"]];
}
#pragma mark - UITextField

-(TableViewItem *)createUITextFieldItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UITextField" contents:@[@"UnderLineTextField",@"UITextField+Undline"]];
}

#pragma mark - UIBarButtonItem
-(TableViewItem *)createUIBarButtonItemItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UIBarButtonItem" contents:@[@"UIBarButtonItem+Badge"]];
}

#pragma mark - UINavigationBar
-(TableViewItem *)createUINavigationBarItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UINavigationBar" contents:@[@"UINavigationBar+Height",@"UINavigationBar+Translucent"]];
}

#pragma mark - UIViewController
-(TableViewItem *)createUIViewControllerItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UIViewController" contents:@[@"UIViewController+HideTabbar"]];
}

#pragma mark - UIActivityIndicatorView
-(TableViewItem *)createUIActivityIndicatorViewItems {
    return [[TableViewItem alloc]initWithSectionTitle:@"UIActivityIndicatorView" contents:@[@"IndicatorBuilder"]];
}

@end
