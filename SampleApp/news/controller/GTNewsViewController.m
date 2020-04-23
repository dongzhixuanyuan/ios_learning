//
//  ViewController.m
//  SampleApp
//
//  Created by liudong on 2020/3/14.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTNewsViewController.h"
#import "NewsTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteView.h"
#import "GTListLoader.h"
#import "GTListItemModel.h"
#import "GTMediator.h"
#import "UIAdapter.h"

@interface GTNewsViewController ()<UITableViewDataSource, UITableViewDelegate, NewsTableViewCellDelegate>
@property (strong, nonatomic, readwrite) UITableView *tableView;
@property (strong, nonatomic, readwrite) NSArray<GTListItemModel *> *data;
@property (strong, nonatomic, readwrite) GTListLoader *loader;
@end

@implementation GTNewsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField* searchView = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view  addSubview:searchView];
    searchView.backgroundColor = [UIColor blueColor];
    [searchView.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor constant:UIAdapter(20)].active = YES;
    [searchView.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor constant:UIAdapter(20)].active = YES;
    [searchView.heightAnchor constraintEqualToConstant:50].active = YES;

    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _data = @[].mutableCopy;
//    [self.view addSubview:_tableView];
//
//    [_tableView.topAnchor constraintEqualToAnchor:searchView.bottomAnchor].active = YES;
//    [_tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
//    [_tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
//    [_tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = true;
    
    
    _loader = [[GTListLoader alloc]init];
    __weak typeof (self) wself = self;
    [_loader loadListData:^(BOOL success, NSArray<GTListItemModel *> *array) {
        if (success) {
            __strong typeof(wself) sself = wself;
            NSLog(@"");
            NSArray *readItems = [[NSUserDefaults standardUserDefaults] arrayForKey:KEY_FOR_READ_ITEMS];
            sself.data = array;
            [sself.tableView reloadData];
        }
    } ];
}

- (void)pushController {
    UIViewController *controller = [[UIViewController alloc]init];
    controller.navigationItem.title = @"内容";
    controller.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    cell.delegate = self;
    [cell fillData:[_data objectAtIndex:indexPath.item]  ];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrl: [_data  objectAtIndex:indexPath.item].url];

    [NewsTableViewCell addReadedItem:[_data objectAtIndex:indexPath.row].uniquekey];

//    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
//    [dictionary setObject:[_data objectAtIndex:indexPath.item].url forKey:@"url"];
//    [dictionary setObject:self.navigationController forKey:@"viewController"];
//    [GTMediator openDetailUrlWithSchema:@"detail" params:dictionary];

    Class class = [GTMediator classForProtocol:@protocol(GTDetailViewProtocol)];
    UIViewController* protocolViewController = [[class alloc] initWithUrl:[NSURL URLWithString:[_data objectAtIndex:indexPath.item].url]];
    

//    __kindof UIViewController *controller =  [GTMediator openDetailUrl:[_data objectAtIndex:indexPath.item].url];

    [self.navigationController pushViewController:protocolViewController animated:YES];
}

- (void)tableViewCell:(UITableViewCell *)tableViewcell deleteBtnClick:(UIButton *)deleteBtn {
    NSLog(@"tableViewCell delegate deleteBtnClick ");
    CGRect rect = [tableViewcell convertRect:deleteBtn.frame toView:nil];
    __weak typeof(self) wself = self;
    [[[GTDeleteView alloc]initWithFrame:self.view.bounds] showAtPoint:rect.origin clickblock:^{
        NSLog(@"showAtPoint");
        __strong typeof(self) strongSelf = wself;
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewcell]] withRowAnimation:(UITableViewRowAnimationAutomatic)];
    } ];
}

@end
