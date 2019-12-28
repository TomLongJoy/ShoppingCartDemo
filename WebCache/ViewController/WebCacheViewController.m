//
//  WebCacheViewController.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2018/9/17.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "WebCacheViewController.h"
#import <WebKit/WebKit.h>
//#import "XLFormDescriptor.h"
//#import "XLFormSectionDescriptor.h"
//#import "XLFormRowDescriptor.h"
//#import "XLForm.h"
@interface WebCacheViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic,strong) WKWebView *wkWebView;

@end

@implementation WebCacheViewController

//- (void)initializeForm
//{
//    XLFormDescriptor * form;
//    XLFormSectionDescriptor * section;
//    XLFormRowDescriptor * row;
//    
//    form = [XLFormDescriptor formDescriptorWithTitle:@"Add Event"];
//    section = [XLFormSectionDescriptor formSection];
//    [form addFormSection:section];
//    
//    // Title
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"Title" rowType:XLFormRowDescriptorTypeText];
//    [row.cellConfigAtConfigure setObject:@"Title" forKey:@"textField.placeholder"];
//    row.required = YES;
//    [section addFormRow:row];
//    
//    // Location
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"location" rowType:XLFormRowDescriptorTypeText];
//    [row.cellConfigAtConfigure setObject:@"Location" forKey:@"textField.placeholder"];
//    [section addFormRow:row];
//    
//    section = [XLFormSectionDescriptor formSection];
//    [form addFormSection:section];
//    
//    // All-day
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"all-day" rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"All-day"];
//    [section addFormRow:row];
//    
//    // Starts
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"starts" rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Starts"];
//    row.value = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
//    [section addFormRow:row];
//    
//    // Ends
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"ends" rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Ends"];
//    row.value = [NSDate dateWithTimeIntervalSinceNow:60*60*25];
//    [section addFormRow:row];
//    
//    section = [XLFormSectionDescriptor formSection];
//    [form addFormSection:section];
//    
//    // Repeat
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"repeat" rowType:XLFormRowDescriptorTypeSelectorPush title:@"Repeat"];
//    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"];
//    row.selectorTitle = @"Repeat";
//    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Never"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Every Day"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Every Week"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Every 2 Weeks"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"Every Month"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"Every Year"],
//                            ];
//    [section addFormRow:row];
//    
//    
//    
//    section = [XLFormSectionDescriptor formSection];
//    [form addFormSection:section];
//    
//    // Alert
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"alert" rowType:XLFormRowDescriptorTypeSelectorPush title:@"Alert"];
//    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"None"];
//    row.selectorTitle = @"Event Alert";
//    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"None"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"At time of event"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"5 minutes before"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"15 minutes before"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"30 minutes before"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"1 hour before"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(6) displayText:@"2 hours before"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(7) displayText:@"1 day before"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(8) displayText:@"2 days before"],
//                            ];
//    [section addFormRow:row];
//    
//    
//    section = [XLFormSectionDescriptor formSection];
//    [form addFormSection:section];
//    
//    // Show As
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"showAs" rowType:XLFormRowDescriptorTypeSelectorPush title:@"Show As"];
//    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Busy"];
//    row.selectorTitle = @"Show As";
//    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Busy"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Free"]];
//    [section addFormRow:row];
//    
//    section = [XLFormSectionDescriptor formSection];
//    [form addFormSection:section];
//    
//    // URL
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"url" rowType:XLFormRowDescriptorTypeURL];
//    [row.cellConfigAtConfigure setObject:@"URL" forKey:@"textField.placeholder"];
//    [section addFormRow:row];
//    
//    // Notes
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"notes" rowType:XLFormRowDescriptorTypeTextView];
//    [row.cellConfigAtConfigure setObject:@"Notes" forKey:@"textView.placeholder"];
//    [section addFormRow:row];
//    
//    
////    self.form = form;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"WebCache";
    
//    [self initializeForm];
//    return;
//    [self.view addSubview:self.wkWebView];
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
