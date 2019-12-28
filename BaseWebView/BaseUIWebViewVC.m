//
//  BaseUIWebViewVC.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2019/4/24.
//  Copyright © 2019年 longjie. All rights reserved.
//

#import "BaseUIWebViewVC.h"
#import "BaseUIWebView.h"
#import <WebViewJavascriptBridge.h>


#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define kHEIGHT [UIScreen mainScreen].bounds.size.height


@interface BaseUIWebViewVC ()<ZLJBaseUIWebViewDelgate>
@property (strong, nonatomic) BaseUIWebView *webView;
@property (nonatomic,strong) WebViewJavascriptBridge *bridge;
@end

@implementation BaseUIWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    NSString *urlStr = @"http://www.zlj.com";
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    if (self.bridge) {
        return;
    }
    self.bridge = [self.webView addWebViewJavascriptBridgeToWebview];
    [self JS2OC];
    
}
- (void)JS2OC{
   
    __weak typeof(self) weakSelf = self;
    [self.bridge registerHandler:@"goBack" handler:^(id data, WVJBResponseCallback responseCallback) {

        weakSelf.webView.canGoBack?[weakSelf.webView goBack]:[weakSelf.navigationController popViewControllerAnimated:YES];
    }];
}

- (BaseUIWebView *)webView {
    if (!_webView) {
        _webView = [[BaseUIWebView alloc] initWithFrame:(CGRectMake(0, 0, KWIDTH, kHEIGHT - 100))];
        _webView.backgroundColor = [UIColor clearColor];
        _webView.uiWebViewDelegate = self;
        _webView.scrollView.bounces = NO;
    }
    return _webView;
}

- (void)baseWebViewDidStartLoad:(UIWebView *)webView{
    
    
}

- (void)baseWebViewDidFinishLoad:(UIWebView *)webView{
    
    
}

- (void)baseWebView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    
}
@end
