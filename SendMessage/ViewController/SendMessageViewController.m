//
//  SendMessageViewController.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2018/9/12.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "SendMessageViewController.h"
#import <MessageUI/MessageUI.h>
@interface SendMessageViewController ()<MFMessageComposeViewControllerDelegate>

@end

@implementation SendMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self showMessageView:@[@"18738103849"] title:@"test" body:@"你是土豪么，么么哒"];


    
}

-(void)showMessageView:(NSArray *)phones title:(NSString *)title body:(NSString *)body{
    
    if( [MFMessageComposeViewController canSendText] )
    {
        MFMessageComposeViewController * controller = [[MFMessageComposeViewController alloc] init];
        controller.recipients = phones;
        controller.navigationBar.tintColor = [UIColor redColor];
        controller.body = body;
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
        [[[[controller viewControllers] lastObject] navigationItem] setTitle:title];//修改短信界面标题
    }
    else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息"
                                                        message:@"该设备不支持短信功能"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}
#pragma mark -- MFMessageComposeViewControllerDelegate
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
    switch (result) {
        case MessageComposeResultSent:
            //信息传送成功
            break;
        case MessageComposeResultFailed:
            //信息传送失败
            break;
        case MessageComposeResultCancelled:
            //信息被用户取消传送
            break;
        default:
            break;
    }
}

@end

//    //打开发送短信界面
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"sms://18738595836"]];

