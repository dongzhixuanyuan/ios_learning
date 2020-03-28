//
//  ViewController.m
//  SampleApp
//
//  Created by liudong on 2020/3/14.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "ViewController.h"
#import "NewsTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteView.h"
//@interface TestView:UIView
//@end
//
//@implementation TestView
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}
//
//
//- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
//    [super willMoveToSuperview:newSuperview];
//}
//- (void)didMoveToSuperview{
//    [super didMoveToSuperview];
//
//
//}
//- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
//    [super willMoveToWindow:newWindow];
//}
//- (void)didMoveToWindow{
//    [super didMoveToWindow];
//}
//@end


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,NewsTableViewCellDelegate>
@property (strong,nonatomic,readwrite)UITableView* tableView;
@property (strong,nonatomic,readwrite)NSMutableArray* data;
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
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _data = @[].mutableCopy;
    for (int i=0; i<20; i++) {
        [_data addObject:@(i)];
    }
    [self.view addSubview:_tableView];
    
}
-(void)pushController{
    UIViewController* controller = [[UIViewController alloc]init];
    controller.navigationItem.title = @"内容";
    controller.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    cell.delegate  =self;
    [cell fillData];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GTDetailViewController* controller = [[GTDetailViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)tableViewCell:(UITableViewCell*)tableViewcell deleteBtnClick:(UIButton*)deleteBtn{
    NSLog(@"tableViewCell delegate deleteBtnClick ");
    CGRect rect = [tableViewcell convertRect:deleteBtn.frame toView:nil];
    __weak typeof(self) wself = self;
    [[[GTDeleteView alloc]initWithFrame:self.view.bounds] showAtPoint:rect.origin clickblock:^{
        NSLog(@"showAtPoint");
        __strong typeof(self) strongSelf = wself;
        [strongSelf.data removeLastObject];
        [strongSelf.tableView deleteRowsAtIndexPaths: @[[strongSelf.tableView indexPathForCell:tableViewcell]] withRowAnimation:(UITableViewRowAnimationAutomatic)];
        
    } ];
}


@end
