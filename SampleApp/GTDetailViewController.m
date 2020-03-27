//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by liudong on 2020/3/25.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>
@interface GTDetailViewController ()
@property(nonatomic,strong,readwrite)WKWebView* webview;
@property(nonatomic,strong,readwrite)UIProgressView* progress;
@end

@implementation GTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:({
        self.webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width,self.view.frame.size.height-88 )];
        self.webview.navigationDelegate = self;
        self.webview;
    })];
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:  @"https://time.geekbang.org"]]];
    [self.view addSubview:({
        self.progress = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
        self.progress.tintColor = [UIColor greenColor];
        self.progress;
    })];
    [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    
}

- (void)dealloc
{
    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
    NSLog(@"移除对webview加载进度的观察");
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"decidePolicyForNavigationAction");
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"didFinishNavigation");
}
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    NSLog(@"进度值:%@",[NSString stringWithFormat:@"%f",self.webview.estimatedProgress]);
    self.progress.progress = self.webview.estimatedProgress;
}


@end
