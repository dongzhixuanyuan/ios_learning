//
//  TodayViewController.m
//  GTToday
//
//  Created by liudong on 2020/4/22.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults* userDefault = [[NSUserDefaults alloc]initWithSuiteName:@"com.liudong"];
    NSNumber* value = [userDefault objectForKey:@"extensionTest"];
    NSLog(@"todayextension value:%d",[value intValue]);
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
