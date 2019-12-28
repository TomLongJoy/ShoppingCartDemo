//
//  BaseWKWebView.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2019/4/25.
//  Copyright © 2019年 longjie. All rights reserved.
//

#import "BaseWKWebView.h"

@interface BaseWKWebView ()<WKNavigationDelegate>

@end

@implementation BaseWKWebView

-(instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration{
    self = [super initWithFrame:frame configuration:configuration];
    if (self) {
        self.navigationDelegate = self;
    }
    return self;
}
#pragma mark -- WKNavigationDelegate
// 接收到服务器跳转请求之后调用 (服务器端redirect)，不一定调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"a接收到服务器跳转请求之后调用%s",__FUNCTION__);
}
// 3 在收到服务器的响应头，根据response相关信息，决定是否跳转。decisionHandler必须调用，来决定是否跳转，参数WKNavigationActionPolicyCancel取消跳转，WKNavigationActionPolicyAllow允许跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    decisionHandler(WKNavigationResponsePolicyAllow);
    NSLog(@"3在收到服务器的响应头++++++++%s",__FUNCTION__);
}
// 1 在发送请求之前，决定是否跳转 
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
    NSLog(@"1在发送请求之前，决定是否跳转 ++++++++%s",__FUNCTION__);
}
// 2 页面开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"2页面开始加载++++++++%s",__FUNCTION__);
    NSLog(@"网络请求的URL++++%@",webView.URL);
}
// 4 开始获取到网页内容时返回
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"4开始获取到网页内容时返回++++++++%s",__FUNCTION__);
}
// 5 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"5页面加载完成之后调用++++++++%s",__FUNCTION__);
}
// 页面加载失败时调用 https://www.jianshu.com/p/ccb421c85b2e
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"aaaaaaaaaaaaaaaaaaaaa页面加载失败时调用 ++++ %s",__FUNCTION__);
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"load_fail" ofType:@"html"];
    NSURL   *fileUrl = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
    [webView loadRequest:request];
    //    [webView loadFileURL:[NSURL fileURLWithPath:filePath] allowingReadAccessToURL:[NSURL fileURLWithPath:filePath]];
}

@end
