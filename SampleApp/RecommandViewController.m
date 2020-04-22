//
//  RecommandViewController.m
//  SampleApp
//
//  Created by liudong on 2020/3/16.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "RecommandViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface RecommandViewController ()

@end

@implementation RecommandViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"like"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"like_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    NSArray *colors = @[[UIColor redColor], [UIColor orangeColor ], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor]];
    for (int i = 0; i < 5; i++) {
        UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
        pageView.backgroundColor = colors[i];
        [pageView addSubview:({
            UIView *subview = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
            subview.backgroundColor = [UIColor yellowColor];
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewClicked)];
            recognizer.delegate = self;
            [subview addGestureRecognizer:recognizer];
            subview;
        })];

        UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(200, 300, 100, 100)];
        [pageView addSubview:secondView];
        secondView.backgroundColor = [UIColor blackColor];
        [secondView.leadingAnchor constraintEqualToAnchor:pageView.leadingAnchor constant:100].active = true;
        [secondView.topAnchor constraintEqualToAnchor:pageView.topAnchor constant:100].active = true;
        [secondView.widthAnchor constraintEqualToConstant:100].active = true;
        [secondView.heightAnchor constraintEqualToConstant:100].active = true;
        [secondView setUserInteractionEnabled:true];
        UITapGestureRecognizer *secondRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(secondViewClick)];
        [secondView addGestureRecognizer:secondRecognizer];
        [scrollView addSubview:pageView];
    }
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
}

- (void)viewClicked {
    NSLog(@"viewClicked");
    NSURL *tartgetAppUrl = [NSURL URLWithString:@"schematest://"];
    BOOL canOpen = [[UIApplication sharedApplication]canOpenURL:tartgetAppUrl];
    if (canOpen) {
//        [[UIApplication sharedApplication] openURL: tartgetAppUrl options:nil completionHandler:^(BOOL success) {
//
//        }];
    } else {
    }

    NSNotification *notification = [NSNotification notificationWithName:@"selectPosition" object:nil userInfo:[NSDictionary dictionaryWithObject:@"codeABC" forKey:@"code"]];
    [[NSNotificationCenter defaultCenter]postNotification:notification];
}

- (void)secondViewClick {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionCarPlay completionHandler:^(BOOL granted, NSError *_Nullable error) {
        if (granted) {
            UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc]init];
            content.title = [NSString localizedUserNotificationStringForKey:@"Hello" arguments:nil];
            content.body = [NSString localizedUserNotificationStringForKey:@"Hello_message_body" arguments:nil];
            content.sound = [UNNotificationSound defaultSound];

            UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
            UNNotificationRequest *notificationRequest = [UNNotificationRequest requestWithIdentifier:@"GTNotification" content:content trigger:trigger];
            [center addNotificationRequest: notificationRequest withCompletionHandler:^(NSError *_Nullable error) {
                if (error == nil) {
                    NSLog(@"已成功推送通知");
                }
            }];
        }
    }];
}

// any offset changes
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidZoom");
}

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging");
}

// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset API_AVAILABLE(ios(5.0))
{
    NSLog(@"scrollViewWillEndDragging");
}
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging");
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

@end
