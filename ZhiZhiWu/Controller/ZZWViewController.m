//
//  ZZWViewController.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2019/2/27.
//  Copyright © 2019年 longjie. All rights reserved.
//

#import "ZZWViewController.h"
#import <ZZWBasePhoneSDK/ZZWWebRTCKit.h>

@interface ZZWViewController ()<ConnectionDelegate>

@end

@implementation ZZWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    UIView  *videoView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    videoView.backgroundColor = UIColor.redColor;
    [self.view addSubview:videoView];
#if TARGET_IPHONE_SIMULATOR 
    
#else
    //智之屋不支持模拟器
    ZZWWebRTCKit *rtcKit = [[ZZWWebRTCKit alloc] initWithRemoteVideoView:videoView
                                                          LocalVideoView:nil
                                                          ViewController:self
                                                                    Room:@"34dcc0a563134f818f8a9a570b00625d-0001-0201" 
                                                                CallType:@"video" 
                                                                IsCallee:YES];
    
    rtcKit.delegate = self;
    [rtcKit startWaiting:^{
        NSLog(@"等待连接对讲");
    }];
    [rtcKit stopWaiting:^{
        NSLog(@"开始对讲");
    }];
    [rtcKit startConnect];
#endif 

    
}
#pragma mark -- ConnectionDelegate
- (void)callIsError:(int)callError {
    NSLog(@"callError:%d",callError);
}

- (void)callIsState:(CallStatus)callStatus {
    NSLog(@"callStatus:%ld",callStatus);
}

-(void)connectionSocket{
    //socket 连接成功
}
-(void)disConnectionSocket{
    //Socket 断开关闭
}

-(void)dealloc{
    NSLog(@"销毁了");
}

@end
/*
 2019-03-20 18:04:19.189664+0800 ShoppingTestDemo[4739:1091969] [6:智之屋SDK]
 2019-03-20 18:04:19.538430+0800 ShoppingTestDemo[4739:1091969] 开始连接房间
 2019-03-20 18:04:24.594984+0800 ShoppingTestDemo[4739:1091969] 等待连接对讲
 2019-03-20 18:04:25.470121+0800 ShoppingTestDemo[4739:1091969] responseString:{"roomLink":"ws://push2.zzwtec.com:9000/34dcc0a563134f818f8a9a570b00625d-0001-0201/cff40e46c422454d957551cb99fdc99e","pcConfig":{"iceServers":[{"credential":"pointer204","url":"stun:120.26.78.171:3478","username":"pointer"},{"credential":"pointer204","url":"turn:120.26.78.171","username":"pointer"},{"credential":"pointer204","url":"stun:121.41.94.122:3478","username":"pointer"},{"credential":"pointer204","url":"turn:121.41.94.122","username":"pointer"},{"credential":"pointer204","url":"stun:121.40.242.107:3478","username":"pointer"},{"credential":"pointer204","url":"turn:121.40.242.107","username":"pointer"}]},"initiator":1,"me":"cff40e46c422454d957551cb99fdc99e","tcpLink":"push2.zzwtec.com/9800/34dcc0a563134f818f8a9a570b00625d-0001-0201/cff40e46c422454d957551cb99fdc99e","roomKey":"34dcc0a563134f818f8a9a570b00625d-0001-0201","room":"ok"}
 2019-03-20 18:04:27.853162+0800 ShoppingTestDemo[4739:1091969] callStatus:4
 */
