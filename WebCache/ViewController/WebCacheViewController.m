//
//  WebCacheViewController.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2018/9/17.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "WebCacheViewController.h"
#import <WebKit/WebKit.h>
@interface WebCacheViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic,strong) WKWebView *wkWebView;

@end

@implementation WebCacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"WebCache";
    [self.view addSubview:self.wkWebView];
    
//    UIView
}
-(WKWebView *)wkWebView{
    if(!_wkWebView){
        
        //https://www.baidu.com/
        NSString    *urlString = @"http://yyp.4kb.cn/1_0/service/mobile/h5/banjie.do?mid=1cpe4fg58hyk102h0fk2896ej6scDEMO&userId=admin&userName=%E7%AE%A1%E7%90%86%E5%91%98&wpHtml=&wpName=&total=&orderTypeLeixing=gongdanleixingId1&rpId=&rpName=&project=&basePath=http://yyp.4kb.cn/&token=0fc64f944d78ff4a0bb0398398af0b8b";
        NSURL *htmlURL = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL 
                                                 cachePolicy:NSURLRequestReturnCacheDataElseLoad 
                                             timeoutInterval:60] ;
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        _wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
        _wkWebView.navigationDelegate = self;
        _wkWebView.UIDelegate = self;
        [_wkWebView loadRequest:request];
    }
    return _wkWebView;
}
#pragma mark -- WKUIDelegate
- (void)webViewDidClose:(WKWebView *)webView{
    
}
#pragma mark -- WKNavigationDelegate
/* 页面开始加载 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}
/* 开始返回内容 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}
/* 页面加载完成 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
}
/* 页面加载失败 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
}
/* 在发送请求之前，决定是否跳转 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
}
/* 在收到响应后，决定是否跳转 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}


@end
