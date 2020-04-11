//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by liudong on 2020/3/25.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>
#import "UIAdapter.h"
@interface GTDetailViewController ()
//如何属性或者方法只要以init作为前缀开头，那么其返回值必须是类的类型。特别强调下属性也必须遵守该规则。
@property (nonatomic, strong, readwrite) WKWebView *webview;
@property (nonatomic, strong, readwrite) UIProgressView *progress;
@property (nonatomic, strong, readwrite) NSURL *loadUrl;
@end

@implementation GTDetailViewController

- (instancetype)initWithUrl:(NSURL *)url {
    self = [super init];
    _loadUrl = url;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    float topMargin = STATUSBAR_HEIGHT + 44;
    [self.view addSubview:({
        self.webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, topMargin, self.view.frame.size.width, self.view.frame.size.height - topMargin )];
        self.webview.navigationDelegate = self;
        self.webview;
    })];
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_loadUrl]]];
    [self.view addSubview:({
        self.progress = [[UIProgressView alloc]initWithFrame:CGRectMake(0, topMargin, self.view.frame.size.width, 20)];
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

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"decidePolicyForNavigationAction");
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"didFinishNavigation");
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    NSLog(@"进度值:%@", [NSString stringWithFormat:@"%f", self.webview.estimatedProgress]);
    self.progress.progress = self.webview.estimatedProgress;
}

@end
