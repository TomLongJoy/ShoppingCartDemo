//
//  ZLJpureLayoutViewController.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2018/9/5.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "ZLJpureLayoutViewController.h"
#import <PureLayout.h>
#import <WebKit/WebKit.h>
@interface ZLJpureLayoutViewController ()

@property (nonatomic,strong) UILabel *label;

@property (strong, nonatomic)  WKWebView *webView;

@property (nonatomic,strong) UIWebView *webView_UI;

@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation ZLJpureLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //蓝色view位于中心, 大小是50pt
    UIView *blueView = [[UIView alloc] init];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];    //注意要先添加到父件上, 再调整
    //设置在父件中心
    [blueView autoCenterInSuperview];
    //设置大小
    [blueView autoSetDimensionsToSize:CGSizeMake(50.0, 50.0)];
    //红色view顶部与蓝色view底部位置一样, 左边与蓝色的右边一样, 宽度跟蓝色view一样, 高度40pt
    UIView *redView = [[UIView alloc] init];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    //设置红色view顶部跟蓝色view的底部对齐
    [redView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:blueView];
    //设置红色view的左边跟蓝色view的右边对齐
    [redView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:blueView];
    //设置红色view的宽度跟蓝色view的宽度一致
    [redView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:blueView];
    //设置红色view的高度为40
    [redView autoSetDimension:ALDimensionHeight toSize:40.0];
    
    
    //黄色view的顶部跟红色view的底部+10pt位置一致, 高度为25pt, 左右距父控件均为20pt
    UIView *yellowView = [[UIView alloc] init];
    [yellowView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:yellowView];
    
    //设置黄色view的顶部高度距离红色view底部10
    [yellowView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:redView withOffset:10.0];
    
    //设置黄色view的高度25
    [yellowView autoSetDimension:ALDimensionHeight toSize:25.0];
    
    //设置黄色view左边距离父件左边20
    [yellowView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.0];
    
    //设置黄色view的右边距离父件右边20
    [yellowView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20.0];
    
    
    
    
    //绿色view的顶部与黄色view的底部间距10, 与父view垂直居中, 高度是黄色view高度的两倍, 宽度是150
    UIView *greenView = [[UIView alloc] init];
    [greenView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:greenView];
    
    //设置绿色view顶部高度距离黄色view底部10
    [greenView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:yellowView withOffset:10.0];
    
    //设置绿色view在父件垂直中心线上
    [greenView autoAlignAxisToSuperviewMarginAxis:ALAxisVertical];
    
    //设置绿色view高度是黄色view高度的2倍
    [greenView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:yellowView withMultiplier:2.0];
    
    //设置绿色view宽度为150
    [greenView autoSetDimension:ALDimensionWidth toSize:150.0]; 
    
    #if TARGET_OS_IPHONE
    
    #endif
    
}

@end 
    
    
//    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 216)];
//    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
//    self.datePicker.datePickerMode = UIDatePickerModeDate;
//    self.datePicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    
//    //当前时间创建NSDate
//    NSDate *localDate = [NSDate date];
//    self.datePicker.minimumDate = localDate;
//    
//    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
//    //设置时间
//    [offsetComponents setYear:0];
//    [offsetComponents setMonth:10];
//    [offsetComponents setDay:5];
//    [offsetComponents setHour:20];
//    [offsetComponents setMinute:0];
//    [offsetComponents setSecond:0];
//    NSDate *maxDate = [gregorian dateByAddingComponents:offsetComponents toDate:localDate options:0];
//    self.datePicker.maximumDate = maxDate;
//    [self.view addSubview:self.datePicker];
    
    
    
//    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
//    //设置地区: zh-中国
//    //设置日期模式(Displays month, day, and year depending on the locale setting)
//    datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
//    // 设置当前显示时间
//    [datePicker setDate:[NSDate date] animated:YES];
//    // 设置显示最大时间（此处为当前时间）
//    [datePicker setMaximumDate:[NSDate date]];
    
    
    
    
    
    
    
    
//    NSString    *urlString = @"http://192.168.1.56:72/workFlow/appsign/wgbmobile/forward.do?fid=1cn2798nz2de102h0dp9004j8f37DEMO&formId=WF-1470011&basePath=http://192.168.1.56:72/workFlow/&token=1e5a383618f6492b9093e3c7b7999a25&userId=admin&type=&name=测试&csType=1&csrType=2&approveSign=1&processId=1cn2798nz2de102h0dp9004j8f37DEMO&chartId=&versionNum=1.2&isVersion=no&reqJieKou=initiateApprovalHtml";
    
//    NSString    *urlString = @"http://192.168.1.56:72/workFlow/appsign/wgbmobile/forward.do?versionNum=1.2&isVersion=no&reqJieKou=myLaunchDetailHtml&type=&launchId=1cp0h961wrze102h0dr55722ylrcDEMO&state=4&title=管理员的测试审批&userId=admin&token=&basePath=http://192.168.1.56:72/workFlow/&isInternal=0&csType=1&csrType=2&approveSign=1&processId=1cn2798nz2de102h0dp9004j8f37DEMO&chartId=&formId=WF-1470011&dataFormId=1cp0h95j2rz5102h0dr3955u6ngyDEMO";
//    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    self.view.backgroundColor = [UIColor whiteColor];
//    self.label = [[UILabel alloc] init]; 
//    self.label.backgroundColor = [UIColor redColor]; 
//    self.label.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:self.label];
//    [self.label autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:20.0f]; 
//
//    self.webView=[[WKWebView alloc]initWithFrame:self.view.bounds];
//    self.webView.backgroundColor = [UIColor clearColor];
//    self.webView.scrollView.bounces = NO;
//    [self.view addSubview:self.webView];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
//    
    
//    self.webView_UI = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:self.webView_UI];
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView_UI loadRequest:request];

//http://192.168.1.56:72/workFlow/appsign/wgbmobile/forward.do?fid=1cn2798nz2de102h0dp9004j8f37DEMO&formId=WF-1470011&basePath=http://192.168.1.56:72/workFlow/&token=1e5a383618f6492b9093e3c7b7999a25&userId=admin&type=&name=%E6%B5%8B%E8%AF%95&csType=1&csrType=2&approveSign=1&processId=1cn2798nz2de102h0dp9004j8f37DEMO&chartId=&versionNum=1.2&isVersion=no&reqJieKou=initiateApprovalHtml
