//
//  BaseUIWebView.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2019/4/24.
//  Copyright © 2019年 longjie. All rights reserved.
//

#import "BaseUIWebView.h"

@interface BaseUIWebView ()<UIWebViewDelegate>


@end

@implementation BaseUIWebView

- (WebViewJavascriptBridge *)addWebViewJavascriptBridgeToWebview{
    [WebViewJavascriptBridge enableLogging];
    WebViewJavascriptBridge *bridge = [WebViewJavascriptBridge bridgeForWebView:self];
    [bridge setWebViewDelegate:self];
    return bridge;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
       
    }
    return self;
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    if ([self.uiWebViewDelegate respondsToSelector:@selector(baseWebViewDidStartLoad:)]) {
        [self.uiWebViewDelegate baseWebViewDidStartLoad:webView];
    }
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
        if (self.uiWebViewDelegate && [self.uiWebViewDelegate respondsToSelector:@selector(baseWebViewDidFinishLoad:)]) {
            [self.uiWebViewDelegate baseWebViewDidFinishLoad:webView];
        }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
        if (self.uiWebViewDelegate && [self.uiWebViewDelegate respondsToSelector:@selector(baseWebViewDidFinishLoad:)]) {
            [self.uiWebViewDelegate baseWebView:webView didFailLoadWithError:error];
//            NSString *filePath = [[NSBundle mainBundle]pathForResource:@"load_fail" ofType:@"html"];
//            NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//            [webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"load_fail" ofType:@"html"];
            NSURL   *fileUrl = [NSURL fileURLWithPath:filePath];
            NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
            [webView loadRequest:request];
        }
}


@end
