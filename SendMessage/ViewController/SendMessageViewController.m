//
//  SendMessageViewController.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2018/9/12.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "SendMessageViewController.h"
#import <MessageUI/MessageUI.h>
#import "JsOCViewController.h"
#import "ZLJpureLayoutViewController.h"
#import <WMPageController.h>
#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define kHEIGHT [UIScreen mainScreen].bounds.size.height

@interface SendMessageViewController ()
@property (nonatomic, strong) WMPageController *pageController;

@end

@implementation SendMessageViewController

- (void)viewDidLoad {
    self.title = @"哈哈";
    self.menuItemWidth = 100; //每个 MenuItem 的宽度
    self.menuView.backgroundColor = UIColor.whiteColor;
    self.menuViewStyle = WMMenuViewStyleLine;//这里设置菜单view的样式
    self.progressHeight = 2;//下划线的高度，需要WMMenuViewStyleLine样式
    self.progressColor = [UIColor redColor];//设置下划线(或者边框)颜色
    self.titleSizeSelected = 15;//设置选中文字大小
    self.titleColorSelected = [UIColor redColor];//设置选中文字颜色
    self.titleColorNormal = UIColor.redColor;
    self.titleSizeNormal = 15;
    self.selectIndex = 0;
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.menuView.backgroundColor = UIColor.whiteColor;

}
//设置viewcontroller的个数
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return 2;
}

//设置对应的viewcontroller
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index == 0) {
        return [JsOCViewController new  ];
    }else {
        return [ZLJpureLayoutViewController new];
    }
    
}
//设置每个viewcontroller的标题
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    if (index == 0) {
        return @"水表";
    }
    return @"电表";
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView{
    return CGRectMake(0, 88, KWIDTH, 52);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView{
    
    return CGRectMake(0, 141, KWIDTH, kHEIGHT - 141);
    
}
@end
/**
 <MFMessageComposeViewControllerDelegate>
 
 //[self showMessageView:@[@"18738103849"] title:@"test" body:@"你是土豪么，么么哒"];
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
 */
//    //打开发送短信界面
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"sms://18738595836"]];


