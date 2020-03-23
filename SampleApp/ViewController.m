//
//  ViewController.m
//  SampleApp
//
//  Created by liudong on 2020/3/14.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "ViewController.h"
#import "NewsTableViewCell.h"
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




@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

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
    UITableView* tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
}
-(void)pushController{
    UIViewController* controller = [[UIViewController alloc]init];
    controller.navigationItem.title = @"内容";
    controller.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    [cell fillData];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController* controller = [[UIViewController alloc]init];
    controller.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
