//
//  GTLocationManager.m
//  SampleApp
//
//  Created by liudong on 2020/4/22.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTLocationManager.h"
#import <CoreLocation/CoreLocation.h>
@interface GTLocationManager ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation GTLocationManager
+ (GTLocationManager *)getInstance {
//    经典的单例模式写法。
    static GTLocationManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [GTLocationManager new];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        [_locationManager requestWhenInUseAuthorization];
    }
    return self;
}
# pragma mark - CLLocationManager代理
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
//    newLocation.coordinate
     NSLog(@"位置更新成功");
    [_locationManager stopUpdatingHeading];
    NSLog(@"停止位置更新");
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
//    授权状态改变
    NSLog(@"授权状态改变");
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse){
        NSLog(@"获取定位权限成功");
        [_locationManager startUpdatingLocation];
    }
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
     NSLog(@"位置更新失败");
}

@end
