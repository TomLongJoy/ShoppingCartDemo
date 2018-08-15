//
//  JsOCViewController.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2018/8/15.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "JsOCViewController.h"
#import <WebKit/WebKit.h>
@interface JsOCViewController ()<WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate>

@property (nonatomic,strong) WKWebView *wkWebView;
@end

@implementation JsOCViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"JS——OC";
    [self.view addSubview:self.wkWebView];
    
    UIButton    *rightButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"oc2js" forState:normal];
    [rightButton setTitleColor:[UIColor blackColor] forState:normal];
    rightButton.frame = CGRectMake(0, 0, 50, 50);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}
-(WKWebView *)wkWebView{
    if(!_wkWebView){
        
        NSURL *htmlURL = [[NSBundle mainBundle] URLForResource:@"index.html" withExtension:nil];
        NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL];
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        [config.userContentController addScriptMessageHandler:self name:@"typeOfAttachment_iOS"];
        [config.userContentController addScriptMessageHandler:self name:@"haveParamsFunction"];
        _wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
        _wkWebView.navigationDelegate = self;
        _wkWebView.UIDelegate = self;
        [_wkWebView loadRequest:request];
    }
    return _wkWebView;
}
#pragma mark -- WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    
    if ([message.name isEqualToString:@"typeOfAttachment_iOS"]) {
        NSLog(@"%@",message.body);
        
    }else if ([message.name isEqualToString:@"haveParamsFunction"]){
        NSLog(@"%@",message.body);
    }
}
- (void)rightButtonClick:(UIButton *)sender{
    
    [self.wkWebView evaluateJavaScript:@"js2oc2('zlj','hhx')"
                     completionHandler:^(id _Nullable handler, NSError * _Nullable error) {
                         NSLog(@"%@", error);
                     }];
    
    /*
     这个方法会调用index.html里面的testButtonClick(x,y)方法。
     方法testButtonClick(x,y)会执行代码 window.webkit.messageHandlers.js2ocParames.postMessage({name:x,age:y});
     执行代码之后会再次走上面代理方法userContentController:didReceiveScriptMessage:
    */
    [self.wkWebView evaluateJavaScript:@"testButtonClick('第一次学习时间:','2018/08/15')"
                     completionHandler:^(id _Nullable handler, NSError * _Nullable error) {
                         NSLog(@"%@", error);
                     }];

}
@end
