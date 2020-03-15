//
//  ViewController.m
//  SampleApp
//
//  Created by liudong on 2020/3/14.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "ViewController.h"
@interface TestView:UIView
@end

@implementation TestView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];


}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
}
- (void)didMoveToWindow{
    [super didMoveToWindow];
}
@end




@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    [view setUserInteractionEnabled:YES];
    
    [self.view addSubview:view];
    //注意：是UITapGestureRecognizer，不是UIGestureRecognizer
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushController)];
    [view addGestureRecognizer:gesture];
    
}
-(void)pushController{
    UIViewController* controller = [[UIViewController alloc]init];
    controller.navigationItem.title = @"内容";
    controller.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
