//
//  ZYLocation.h
//  Shoppix
//
//  Created by 杨志远 on 2017/10/10.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *const ZYLocationSuccessNotification;

@interface ZYLocation : NSObject
@property(nonatomic,copy)NSString *latitude;
@property(nonatomic,copy)NSString *longtitude;
// 位置
@property(nonatomic,copy)NSString *name;
// 街道
@property(nonatomic,copy)NSString *thoroughfare;
// 子街道
@property(nonatomic,copy)NSString *subThoroughfare;
// 市
@property(nonatomic,copy)NSString *locality;
// 区县
@property(nonatomic,copy)NSString *subLocality;
// 行政区
@property(nonatomic,copy)NSString *administrativeArea;
// 国家
@property(nonatomic,copy)NSString *country;


+(instancetype)sharedLocation;

/**
 请求定位
 */
-(void)requestAuthorStatus;

/**
 开始定位
 */
-(void)start;

/**
 是否能够开始定位  即是否可以调用start方法

 @return 是否
 */
-(BOOL)canLocation;

/**
 停止定位
 */
-(void)stop;

@end
