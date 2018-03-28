//
//  IndicatorBuilder.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/26.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "IndicatorBuilder.h"
@interface IndicatorBuilder()
@property(nonatomic,strong)UIActivityIndicatorView *activityView;
@end

@implementation IndicatorBuilder
+(instancetype)sharedIndicator {
    static id shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

-(void)show:(UIView *)view {
    [view addSubview:self.activityView];
    [view bringSubviewToFront:self.activityView];
    self.activityView.center = view.center;
    [self.activityView startAnimating];
}
-(void)hide {
    [self.activityView stopAnimating];
}

-(UIActivityIndicatorView *)activityView {
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _activityView;
}

-(void)setIndicatorViewStyle:(UIActivityIndicatorViewStyle)indicatorViewStyle {
    self.activityView.activityIndicatorViewStyle = indicatorViewStyle;
    _indicatorViewStyle = indicatorViewStyle;
}


@end
