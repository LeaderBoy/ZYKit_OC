//
//  DisplayCell.h
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/21.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewItem.h"
@protocol  DisplayCellDelegate<NSObject>
@optional
-(void)barButtonItem_badge;
-(void)navigationBar_height;
-(void)navigationBar_translucent;
@end


@interface DisplayCell : UITableViewCell
@property(nonatomic,weak)id<DisplayCellDelegate>delegate;

-(void)configueWithItemClass:(NSString *)itemClass itemTitle:(NSString *)itemTitle;
@end
