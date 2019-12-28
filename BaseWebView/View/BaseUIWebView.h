//
//  BaseUIWebView.h
//  ShoppingTestDemo
//
//  Created by TomLong on 2019/4/24.
//  Copyright © 2019年 longjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebViewJavascriptBridge.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZLJBaseUIWebViewDelgate <NSObject>

- (void)baseWebViewDidStartLoad:(UIWebView *)webView;//开始加载

- (void)baseWebViewDidFinishLoad:(UIWebView *)webView;//结束加载

- (void)baseWebView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;//加载失败
@end


@interface BaseUIWebView : UIWebView

@property (nonatomic,weak) id<ZLJBaseUIWebViewDelgate> uiWebViewDelegate;

- (WebViewJavascriptBridge *)addWebViewJavascriptBridgeToWebview;
@end

NS_ASSUME_NONNULL_END
