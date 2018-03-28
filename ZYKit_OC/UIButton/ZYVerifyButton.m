//
//  ZYVerifyButton.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/22.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//

#import "ZYVerifyButton.h"

static NSString *const kVerifyTitle = @"获取验证码";
static NSString *const kVerifyingTitle = @"%@秒后重新发送";

@interface ZYVerifyButton()
@property(nonatomic)dispatch_source_t timer;
@end
@implementation ZYVerifyButton

+(instancetype)buttonWithType:(UIButtonType)buttonType {
    ZYVerifyButton * button = [super buttonWithType:buttonType];
    [button setUp];
    return button;
}

-(void)setUp {
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.layer.cornerRadius = 3.0;
    self.clipsToBounds = YES;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(startTime) forControlEvents:UIControlEventTouchUpInside];
    self.enabled = YES;
}

-(void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    [self setColor:enabled ?_enableColor : _unEnableColor  enable:enabled];
    [self setTitle:enabled ? _verifyTitle : _verifyingTitle enable:enabled];
}

-(void)setColor:(UIColor *)color enable:(BOOL)enable {
    if (enable) {
        self.backgroundColor = color ?: [UIColor colorWithRed:43/255.0 green:171/255.0 blue:63/255.0 alpha:1];
        _enableColor = color;
    }else{
        self.backgroundColor = color ?: [UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1];
        _unEnableColor = color;
    }
}

-(void)setTitle:(NSString *)title enable:(BOOL)enable {
    if (enable) {
        [self setTitle:title ?: kVerifyTitle forState:UIControlStateNormal];
        _verifyTitle = title;
    }else{
        _verifyingTitle = title;
    }
}


-(void)setEnableColor:(UIColor *)enableColor {
    if (self.isEnabled) {
        [self setColor:enableColor enable:YES];
    }
    _enableColor = enableColor;
}

-(void)setUnEnableColor:(UIColor *)unEnableColor {
    if (!self.isEnabled) {
        [self setColor:unEnableColor enable:YES];
    }
    _unEnableColor = unEnableColor;
}

-(void)setVerifyingTitle:(NSString *)verifyingTitle {
    _verifyingTitle = [@"%@" stringByAppendingString:verifyingTitle];
}

-(void)resetTime {
    dispatch_source_cancel(self.timer);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.userInteractionEnabled = YES;
        self.enabled = YES;
        [self setColor:_enableColor enable:YES];
    });
}

-(void)setTimeOut:(int)timeOut {
    if (timeOut < 0) {
        _timeOut = 30;
    }
    _timeOut = timeOut;
}
-(void)startTime{
    self.enabled = NO;
    __block int timeout = 30;
    if (_timeOut) {
        timeout = _timeOut;
    }
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    self.timer = _timer;
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    
    [self setColor:_unEnableColor enable:NO];

    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.userInteractionEnabled = YES;
                self.enabled = YES;
                self.verifyTimeOff();
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:_verifyingTitle ?: kVerifyingTitle,strTime] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
    self.verifyCall();
    
}

@end
