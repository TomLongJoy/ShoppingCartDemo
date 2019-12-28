//
//  ZZWWebRTCKit.h
//  ZZWBasePhoneSDK
//
//  Created by weihao on 2018/4/19.
//  Copyright © 2018年 com.smartHouse. All rights reserved.
//

typedef enum : long {
    CALL_WAITING,//等待有接听
    CALL_IS_FULL,//已有人接听，建议提示后挂断
    CALL_NOROOM,//对方已挂断，建议提示后挂断
    CALL_NOBODY,//无人接听，主呼情况下计时调，被呼
    CALL_BEGIN,//开始通话
    CALL_BUSY,//占线,建议提示后挂断
    CALL_FINISH,//结束
    CALL_HANGUP//对挂断，建议提示后挂断
} CallStatus;

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^dispatch_block)(void);
@protocol ConnectionDelegate <NSObject>

//-(void)connectionSocket;//socket 连接成功
//-(void)disConnectionSocket;//Socket 断开关闭

/*
 呼叫时的错误回调  0 websoket连接错误 1:peerconnection连接错误 2:onChanne连接错误 3:初始化错误
 */
- (void)callIsError:(int)callError;

/*
 呼叫状态回调
 */
- (void)callIsState:(CallStatus)callStatus;

@end
@interface ZZWWebRTCKit : NSObject
@property (weak, nonatomic) id <ConnectionDelegate> delegate;


/**
 WEBRTC初始化

 @param remoteVideoView 视频渲染的空间
 @param localVideoView 目前传 nil
 @param theViewController 控件所在的VC
 @param room 推送收到的room信息
 @param callType 呼叫类型  目前视频传“video”
 @param isCallee 是否是被呼  被呼 YES
 @return 返回ZZWWebRTCkit对象
 */
-(instancetype)initWithRemoteVideoView:(UIView *)remoteVideoView
                        LocalVideoView:(UIView *)localVideoView
                        ViewController:(UIViewController *)theViewController
                                  Room:(NSString *)room
                              CallType:(NSString *)callType
                              IsCallee:(BOOL)isCallee;

/**
 开始连接
 */
- (void)startConnect;
// 开始等待连接
-(void)startWaiting:(dispatch_block)block;
// 结束等待连接
-(void)stopWaiting:(dispatch_block)block;
// 断开连接
- (void)disconnect;
//挂起
- (void)overSessionAction:(BOOL)localOver;
//开锁
- (void)openDoorAction;
//设置获取会话
- (void)setupCaptureSession;





@end
