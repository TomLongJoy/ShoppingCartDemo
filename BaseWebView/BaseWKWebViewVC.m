//
//  BaseWKWebViewVC.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2019/4/25.
//  Copyright © 2019年 longjie. All rights reserved.
//

#import "BaseWKWebViewVC.h"
#import "BaseWKWebView.h"

@interface BaseWKWebViewVC ()<WKUIDelegate>
@property (nonatomic,strong) BaseWKWebView *wkWebView;
@end 

@implementation BaseWKWebViewVC



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.cyanColor;
    [self.view addSubview:self.wkWebView];
}

-(WKWebView *)wkWebView{
    if(!_wkWebView){
        NSString    *urlString = @"https://zlj.com/";//@"https://www.baidu.com/";//
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *htmlURL = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL];
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.selectionGranularity = WKSelectionGranularityDynamic;
        config.allowsInlineMediaPlayback = YES;
        WKPreferences *preferences = [WKPreferences new];
        preferences.javaScriptEnabled = YES;//是否支持JavaScript
        preferences.javaScriptCanOpenWindowsAutomatically = YES;//不通过用户交互，是否可以打开窗口
        config.preferences = preferences;        
        _wkWebView = [[BaseWKWebView alloc] initWithFrame:self.view.bounds configuration:config];
        _wkWebView.UIDelegate = self;
        _wkWebView.backgroundColor = UIColor.redColor;
        [_wkWebView loadRequest:request];
    }
    return _wkWebView;
}


@end
