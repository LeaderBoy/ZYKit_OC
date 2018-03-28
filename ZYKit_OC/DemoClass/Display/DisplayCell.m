//
//  DisplayCell.m
//  ZYKit_OC
//
//  Created by 杨志远 on 2018/3/21.
//  Copyright © 2018年 BaQiWL. All rights reserved.
//
#import <AssetsLibrary/AssetsLibrary.h>

#import "DisplayCell.h"

// UIScreen
#import "UIScreen+Bounds.h"
// UIView
#import "UIView+Bounds.h"

// UIImage
#import "UIImage+Scale.h"
#import "UIImage+Circle.h"
#import "UIImage+Position.h"
#import "UIImage+Blur.h"
// UIButton
#import "UIButton+Badge.h"
#import "ZYVerifyButton.h"

// UIColor
#import "UIColor+Hex.h"
#import "UIColor+ZYColorToString.h"

// UILabel
#import "UILabel+ZYLetterSpace.h"

// UITextView
#import "ZYPlaceholderTextView.h"

// UITextField
#import "UITextField+Undline.h"
#import "UnderLineTextField.h"

// UIActivityIndicatorView
#import "IndicatorBuilder.h"

// NSObject
#import "NSObject+RequestImageAuthorization.h"
#import "NSObject+NetworkReachable.h"
#import "NSObject+EmptyObject.h"
#import "NSObject+Swizzling.h"

// NSDate
#import "NSDate+Escort.h"

// NSDictionary
#import "NSDictionary+Log.h"

// NSArray
#import "NSArray+Log.h"

// NSString
#import "NSString+UTF8.h"
#import "NSString+Scanner.h"
#import "NSString+ZYStringToColor.h"

// NSTimer
#import "NSTimer+ZYTimer.h"

@interface DisplayCell()
@property (weak, nonatomic) IBOutlet UILabel *methodTitle;
@property (weak, nonatomic) IBOutlet UIImageView *displayImageView;
@property (weak, nonatomic) IBOutlet UIButton *displayButton;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UITextField *displayTextField;

@end

@implementation DisplayCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)configueWithItemClass:(NSString *)itemClass itemTitle:(NSString *)itemTitle {
    if (_displayImageView.image) {
        _displayImageView.image = nil;
    }
    _methodTitle.text = itemTitle;
    [self methodForItemClass:itemClass itemTitle:itemTitle];
}

-(void)methodForItemClass:(NSString *)itemClass itemTitle:(NSString *)itemTitle {
    
    // UI
    if ([itemClass isEqualToString:@"UIScreen"]) {
        [self methodForUIScreen:itemTitle];
    }else if ([itemClass isEqualToString:@"UIView"]) {
        [self methodForUIView:itemTitle];
    }else if ([itemClass isEqualToString:@"UIButton"]) {
        [self methodForUIButton:itemTitle];
    }else if ([itemClass isEqualToString:@"UIImage"]) {
        [self methodForUIImage:itemTitle];
    }else if ([itemClass isEqualToString:@"UIImageView"]) {
        [self methodForUIImageView:itemTitle];
    }else if ([itemClass isEqualToString:@"UILabel"]) {
        [self methodForUILabel:itemTitle];
    }else if ([itemClass isEqualToString:@"UIActivityIndicatorView"]) {
        [self methodForUIActivityIndicatorView:itemTitle];
    }else if ([itemClass isEqualToString:@"UITextField"]) {
        [self methodForUITextField:itemTitle];
    }else if ([itemClass isEqualToString:@"UITextView"]) {
        [self methodForUITextView:itemTitle];
    }else if ([itemClass isEqualToString:@"UIColor"]) {
        [self methodForUIColor:itemTitle];
    }else if ([itemClass isEqualToString:@"UINavigationBar"]) {
        [self methodForUINavigationBar:itemTitle];
    }else if ([itemClass isEqualToString:@"UIBarButtonItem"]) {
        [self methodForUIBarButtonItem:itemTitle];
    }else if ([itemClass isEqualToString:@"UIViewController"]) {
        [self methodForUIViewControllerItem:itemTitle];
    }
    
    // NS
    
    else if ([itemClass isEqualToString:@"NSObject"]) {
        [self methodForNSObjectItem:itemTitle];
    }else if ([itemClass isEqualToString:@"NSDate"]) {
        [self methodForNSDateItem:itemTitle];
    }else if ([itemClass isEqualToString:@"NSDictionary"]) {
        [self methodForNSDictionaryItem:itemTitle];
    }else if ([itemClass isEqualToString:@"NSArray"]) {
        [self methodForNSArrayItem:itemTitle];
    }else if ([itemClass isEqualToString:@"NSString"]) {
        [self methodForNSStringItem:itemTitle];
    }else if ([itemClass isEqualToString:@"NSTimer"]) {
        [self methodForNSTimerItem:itemTitle];
    }
    
    
    
    
    
}

#pragma mark - UIScreen
-(void)methodForUIScreen:(NSString *)itemTitle {
    
    if ([itemTitle isEqualToString:@"UIScreen+Bounds"]) {
        _displayLabel.text = [NSString stringWithFormat:@"screen的宽度为%2.f",[UIScreen screenHeight]];
        _displayLabel.hidden = NO;
    }
    
}

#pragma mark - UIView
-(void)methodForUIView:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"UIView+Bounds"]) {
        _displayLabel.text = [NSString stringWithFormat:@"label的X坐标为%2.f",_displayLabel.x];
        _displayLabel.hidden = NO;
    }

}
#pragma mark - UIButton
-(void)methodForUIButton:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"UIButton+Badge"]) {
        _displayButton.badgeValue = @"5";
        _displayButton.hidden = NO;
    }else if ([itemTitle isEqualToString:@"ZYVerifyButton"]) {
        ZYVerifyButton *button = [ZYVerifyButton buttonWithType:UIButtonTypeCustom];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        button.enableColor = [UIColor redColor];
        button.unEnableColor = [UIColor blackColor];
        
//        button.verifyingTitle = @"秒";
//        button.verifyTitle = @"请求";
        
        __weak typeof(ZYVerifyButton)*b = button;
        button.verifyCall = ^{
            NSLog(@"请求验证码");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"请求成功");
                __strong typeof(ZYVerifyButton)*b2 = b;
                [b2 resetTime];
            });
        };
        button.verifyTimeOff = ^{
            NSLog(@"计时结束");
        };
        button.timeOut = 40;
        [self.contentView addSubview:button];
        
        NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200];
        
        NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:44];
        
        NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_methodTitle attribute:NSLayoutAttributeBottom multiplier:1 constant:50];
        
        width.active = YES;
        height.active = YES;
        centerX.active = YES;
        top.active = YES;
    }
}
#pragma mark - UIImage
-(void)methodForUIImage:(NSString *)itemTitle {
    UIImage *image = [UIImage imageNamed:@"roundImage.jpg"];
    NSLog(@"%f",image.size.width);
    if ([itemTitle isEqualToString:@"UIImage+Scale"]) {
        image = [image scaleToSize:CGSizeMake(20, 20)];
        NSLog(@"%f",image.size.width);
    }else if ([itemTitle isEqualToString:@"UIImage+Circle"]) {
        image = [image circleImage];
        NSLog(@"%f",image.size.width);
    }else if ([itemTitle isEqualToString:@"UIImage+Position"]) {
        image = [image positionOffsetXWithPt:5];
        NSLog(@"%f",image.size.width);
    }else if ([itemTitle isEqualToString:@"UIImage+Blur"]) {
        image = [image blurWithRadius:10 tintColor:[UIColor colorWithWhite:1 alpha:0.3] saturationDeltaFactor:1 maskImage:nil];
        NSLog(@"%f",image.size.width);
    }
    _displayImageView.hidden = NO;
    _displayImageView.image = image;
}
#pragma mark - UIImageView
-(void)methodForUIImageView:(NSString *)itemTitle {
    
}
#pragma mark - UILabel
-(void)methodForUILabel:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"UILabel+ZYLetterSpace"]) {
        [_displayLabel zy_addLetterSpace:3];
    }
    _displayLabel.hidden = NO;
}
#pragma mark - UIActivityIndicatorView
-(void)methodForUIActivityIndicatorView:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"IndicatorBuilder"]) {
        [[IndicatorBuilder sharedIndicator] show:self.contentView];
    }
}
#pragma mark - UITextField
-(void)methodForUITextField:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"UITextField+Undline"]) {
        [_displayTextField zy_enableUndline];
        _displayTextField.hidden = NO;
    }else if ([itemTitle isEqualToString:@"UnderLineTextField"]) {
        UnderLineTextField *undline = [[UnderLineTextField alloc] init];
        undline.placeholder = @"姓名";
        
#if 1
        undline.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NS"]];
#elif 0
        
        undline.isEnableLeftViewM = NO;
        CGRect frame = CGRectMake(0, 0, 40, 44);
        UIImage *image = [UIImage imageNamed:@"NS"];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectInset(frame, 5, 0)];
        imageView.image = image;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        UIView *leftView = [[UIView alloc] initWithFrame:frame];
        [leftView addSubview:imageView];
        undline.leftView = leftView;
#endif
        
        undline.leftViewMode=UITextFieldViewModeAlways;
        undline.clearButtonMode = UITextFieldViewModeWhileEditing;
        undline.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:undline];
        
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:undline attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
        
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:undline attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-20];

        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:undline attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_methodTitle attribute:NSLayoutAttributeBottom multiplier:1 constant:50];
        
        NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:undline attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:44];
        
        left.active = YES;
        right.active = YES;
        height.active = YES;
        top.active = YES;
    }
}
#pragma mark - UITextView
-(void)methodForUITextView:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"ZYPlaceholderTextView"]) {
        ZYPlaceholderTextView *textView = [[ZYPlaceholderTextView alloc] init];
        [self.contentView addSubview:textView];

        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:5];
        
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-5];

        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_methodTitle attribute:NSLayoutAttributeBottom multiplier:1 constant:10];

        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-20];
        
        top.active = YES;
        left.active = YES;
        right.active = YES;
        bottom.active = YES;
        textView.translatesAutoresizingMaskIntoConstraints = NO;
        textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        textView.layer.borderWidth = 1;
        textView.placeholder = @"描述";
    }
}
#pragma mark - UIColor
-(void)methodForUIColor:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"UIColor+ZYColorToString"]) {
        UIColor * red = [UIColor colorWithRed:0.2 green:0.5 blue:0.3 alpha:0.3];
        _displayLabel.text = [red zy_colorToString];
        _displayLabel.hidden = NO;
        self.contentView.backgroundColor = red;
    }else if ([itemTitle isEqualToString:@"UIColor+Hex"]) {
        _displayLabel.text = @"#0f0f0f";
        _displayLabel.textColor = [UIColor whiteColor];
        _displayLabel.hidden = NO;
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#0f0f0f"];
    }
}
#pragma mark - UINavigationBar
-(void)methodForUINavigationBar:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"UINavigationBar+Height"]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(navigationBar_height)]) {
            [self.delegate navigationBar_height];
        }
    }else if ([itemTitle isEqualToString:@"UINavigationBar+Translucent"]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(navigationBar_translucent)]) {
            [self.delegate navigationBar_translucent];
        }
    }
}
#pragma mark - UIBarButtonItem
-(void)methodForUIBarButtonItem:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"UIBarButtonItem+Badge"]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(barButtonItem_badge)]) {
            [self.delegate barButtonItem_badge];
        }
    }
}

#pragma mark - UIViewController
-(void)methodForUIViewControllerItem:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"UIViewController+HideTabbar"]) {
        _displayLabel.hidden = NO;
        _displayLabel.text = @"进入的时候隐藏tabbar 返回的时候显示tabbar";
    }
}

#pragma mark - NSObject
-(void)methodForNSObjectItem:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"NSObject+EmptyObject"]) {
        NSArray *array = @[];
        _displayLabel.text = [NSString stringWithFormat:@"当前对象是否为空: %@",[array isEmptyObject] ?@"是":@"否"];
        _displayLabel.hidden = NO;
    }else if ([itemTitle isEqualToString:@"NSObject+Swizzling"]) {
        [[self class] methodSwizzlingWithOriginalSelector:@selector(loveProgramming) bySwizzledSelector:@selector(donotloveProgramming)];
        _displayLabel.text = @"请查看打印";
        _displayLabel.hidden = NO;
        [self loveProgramming];
    }else if ([itemTitle isEqualToString:@"NSObject+NetworkReachable"]) {
        _displayLabel.text = [NSString stringWithFormat:@"当前是否可以联网: %@",[self zy_isNetworkReachable] ?@"是":@"否"];
        _displayLabel.hidden = NO;
    }else if ([itemTitle isEqualToString:@"NSObject+RequestImageAuthorization"]) {
#if 0
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *data =  [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522065768985&di=eadfe3c9390dff6ea2fd5e4ecdc02bca&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F91ef76c6a7efce1b22ed3ed1a451f3deb58f65e3.jpg"]];
            [self zy_saveImageData:data completeHandler:^(BOOL success, NSError * _Nullable error) {
                _displayLabel.hidden = NO;
                _displayLabel.text = success ? @"保存成功" : @"保存失败";
            }];
        });
        
#elif 1
        [self zy_requestImageAuthorization:^(ZYRequestImageAuthorizationStatus status) {

            dispatch_async(dispatch_get_main_queue(), ^{
                _displayLabel.text = [NSString stringWithFormat:@"相册访问权限: %@",(status == 3) ? @"是" : @"否"];
                _displayLabel.hidden = NO;
            });
        }];
#endif
        
    }
}


#pragma mark - NSDate
-(void)methodForNSDateItem:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"NSDate+Escort"]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"YYYY-MM-dd";
        _displayLabel.text = [formatter stringFromDate:[NSDate dateTomorrow]];
        _displayLabel.hidden = NO;
    }
}

#pragma mark - NSDictionary
-(void)methodForNSDictionaryItem:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"NSDictionary+Log"]) {
        _displayLabel.text = @"请查看控制台打印";
        _displayLabel.hidden = NO;
        
        NSDictionary *dic = @{
                              @"sex"     : @"Man",
                              @"chinese" : @"中文字符",
                              @"Unicode" : @"🤣😂"};
        NSLog(@"%@", dic);
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"unicode" ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:path];
        NSDictionary *dic2 = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",dic2);
        
    }
}


#pragma mark - NSArray
-(void)methodForNSArrayItem:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"NSArray+Log"]) {
        _displayLabel.text = @"请查看控制台打印";
        _displayLabel.hidden = NO;
        NSDictionary *dic = @{
                              @"sex"     : @"Man",
                              @"chinese" : @"中文字符",
                              @"Unicode" : @"🤣😂"};
        NSArray *array = @[dic];
        NSLog(@"%@", array);
    }
}



#pragma mark - NSString
-(void)methodForNSStringItem:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"NSString+UTF8"]) {
        NSString *str = @"中文";
        NSString *utfStr = [str zy_toUTF8];
        
        _displayLabel.text = [NSString stringWithFormat:@"%@ -- %@ \n %@ -- %@",str,[@"中文" zy_toUTF8],utfStr,[utfStr zy_toString]];
        _displayLabel.hidden = NO;
    }else if ([itemTitle isEqualToString:@"NSString+Scanner"]) {
        
        _displayLabel.text = [NSString stringWithFormat:@"32是否是纯数字 -- %d",[@"32" zy_isPureInt]];
        _displayLabel.hidden = NO;
    }else if ([itemTitle isEqualToString:@"NSString+ZYStringToColor"]) {
        UIColor * color = [@"1 0 1" zy_stringToColor];
        self.contentView.backgroundColor = color;
    }
}

#pragma mark - NSTimer
-(void)methodForNSTimerItem:(NSString *)itemTitle {
    if ([itemTitle isEqualToString:@"NSTimer+ZYTimer"]) {
        [NSTimer zy_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
            _displayLabel.text = @"1秒后显示 注意并没有调用[timer invalidate]返回后页面依旧销毁了";
            _displayLabel.hidden = NO;
        } repeats:NO];
    }
}

-(void)loveProgramming {
    NSLog(@"loveProgramming");
}
-(void)donotloveProgramming {
    NSLog(@"donotloveProgramming");
}





@end
