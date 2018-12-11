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


- (void)dealloc{
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"typeOfAttachment_iOS"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"haveParamsFunction"];
    
}

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


/**
 * 异步执行 + 串行队列
 * 特点：会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务。
 */
- (void)asyncSerial {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncSerial---begin");
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"asyncSerial---end");
    
    
}
/**
 输出结果：
 
  17.029999 [20008:5024757] currentThread---{number = 1, name = main}
 
  17.030212 [20008:5024757] asyncSerial---begin
 
  17.030364 [20008:5024757] asyncSerial---end
 
  19.035379 [20008:5024950] 1---{number = 3, name = (null)}
 
  21.037140 [20008:5024950] 1---{number = 3, name = (null)}
 
  23.042220 [20008:5024950] 2---{number = 3, name = (null)}
 
  25.042971 [20008:5024950] 2---{number = 3, name = (null)}
 
  27.047690 [20008:5024950] 3---{number = 3, name = (null)}
 
  29.052327 [20008:5024950] 3---{number = 3, name = (null
 */

@end
/**
 
 semaphore = dispatch_semaphore_create(1);
 for (int i = 0; i < 100; i ++) {
 dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
 NSLog(@"%d", i);
 sleep(1);
 {
 dispatch_semaphore_signal(semaphore);
 }
 }
 */
