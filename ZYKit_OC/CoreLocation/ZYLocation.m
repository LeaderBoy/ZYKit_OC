//
//  ZYLocation.m
//  Shoppix
//
//  Created by 杨志远 on 2017/10/10.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYLocation.h"
#import <CoreLocation/CoreLocation.h>

NSString *const ZYLocationSuccessNotification = @"ZYLocationSuccessNotification";

@interface ZYLocation()<CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation ZYLocation
+(instancetype)sharedLocation {
    static id shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

-(void)start {
    if ([self canLocation]) {
        [self.locationManager startUpdatingLocation];
    }else {
        NSLog(@"不支持定位或者定位未开启");
    }
}

-(BOOL)canLocation {
    return ([self authorStatus] == kCLAuthorizationStatusAuthorizedAlways || [self authorStatus] == kCLAuthorizationStatusAuthorizedWhenInUse);
}

-(void)requestAuthorStatus {
    CLAuthorizationStatus status = [self authorStatus];
    if (status == kCLAuthorizationStatusNotDetermined && [self isLocationEnable]) {
        if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
            [self.locationManager requestAlwaysAuthorization];
        }
    }
}

-(BOOL)isLocationEnable {
    return [CLLocationManager locationServicesEnabled];
}

-(CLAuthorizationStatus)authorStatus {
    return [CLLocationManager authorizationStatus];
}

-(void)stop {
    [self.locationManager stopUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *location = locations.lastObject;
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    __weak typeof(self)weakSelf = self;
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark * place = placemarks.lastObject;
        _name = place.name;
        _thoroughfare = place.thoroughfare;
        _subThoroughfare = place.subThoroughfare;
        _administrativeArea = place.administrativeArea;
        _subLocality = place.subLocality;
        _country = place.country;
        [weakSelf locationSuccess];
    }];
    
    [self stop];
}

-(void)locationSuccess {
    [[NSNotificationCenter defaultCenter]postNotificationName:ZYLocationSuccessNotification object:nil];
}


-(CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

@end
