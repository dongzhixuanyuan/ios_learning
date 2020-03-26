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
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"decidePolicyForNavigationAction");
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"didFinishNavigation");
}



@end
