//
//  WIFIMessageViewController.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2018/9/12.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "WIFIMessageViewController.h"
#import<SystemConfiguration/CaptiveNetwork.h>

#import <NetworkExtension/NetworkExtension.h>  
#import "ZLJDaiYanShouModel.h"
#import <MJExtension.h>
@interface WIFIMessageViewController ()
@property (strong, nonatomic) UIScrollView *scrollerView;

@end

@implementation WIFIMessageViewController
-(void)refreshAction
{
    NSLog(@"下拉刷新");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.scrollerView.refreshControl endRefreshing]; //结束刷新
    });
}     

- (void)mdoelMJ{
    NSDictionary    *dic = @{
        @"state": @"1",
        @"time": @"2019-07-03 15:42:16",
        @"data": @[@{
            @"coorDepName": @"",
            @"maintenancePerson": @"管理员,赵龙杰,wangw,崔东瑞,2324",
            @"criterionCode": @"DYQ",
            @"maintenanceLevel": @"日常维保",
            @"deviceName": @"变压器",
            @"deviceId": @"1dcde74bjtw5102hn1p3081m5sx3",
            @"maintenanceText": @"日常擦拭",
            @"codeId": @"1dcde74cxtw6102hn1p3081bbkfk",
            @"coortext": @"",
            @"taketime": @"2019-07-03 14:08:36",
            @"losetime": @"2019-07-06 14:08:29",
            @"spaceLocation": @"点都大厦一楼西北角",
            @"maintenancewbsm": @"哈哈哈图片显示",
            @"id": @"1deu75xth0fg102hn1k93362h16l",
            @"maintenanceType": @"4",
            @"filePaths": @{
                @"files": @"upload\\device-mobile\\2019\\07\\03\\1deu7jj160ge102hn1k0894hd6gn.png,upload\\device-mobile\\2019\\07\\03\\1deu7jj5s0gf102hn1k0894mw33t.png",
                @"id": @"1deu75xth0fg102hn1k93362h16l"
            },
            @"syTime": @"70小时27分钟"
        }]
        };
    
    ZLJDaiYanShouModel *model =   [ZLJDaiYanShouModel mj_objectWithKeyValues:dic];
    ZLJDaiYanShouData *yanShouData = model.data[0];
    
    NSLog(@"zlj--当前输出：%s",__FUNCTION__);
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self  mdoelMJ];
    
    
    return;
    self.scrollerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollerView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.scrollerView];
    
//    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
//    testView.backgroundColor = [UIColor greenColor];
//    [self.scrollerView addSubview:testView];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor grayColor];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [refreshControl addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventValueChanged];
    self.scrollerView.refreshControl = refreshControl;

    
    
    
//    [self getWifiList];
}
- (void)getWifiList {
    
    NSMutableDictionary* options = [[NSMutableDictionary alloc] init];
    [options setObject:@"上网" forKey:kNEHotspotHelperOptionDisplayName];
    dispatch_queue_t queue = dispatch_queue_create("com.myapp.ex", NULL);
    BOOL returnType = [NEHotspotHelper registerWithOptions:options 
                                                     queue:queue 
                                                   handler: ^(NEHotspotHelperCommand * cmd) {
                                                       NEHotspotNetwork* network;
                                                       NSLog(@"COMMAND TYPE:   %ld", (long)cmd.commandType);
                                                       [cmd createResponse:kNEHotspotHelperResultAuthenticationRequired];
                                                       if (cmd.commandType == kNEHotspotHelperCommandTypeEvaluate || cmd.commandType ==kNEHotspotHelperCommandTypeFilterScanList) {
                                                           NSLog(@"WIFILIST:   %@", cmd.networkList);
                                                           for (network  in cmd.networkList) {
                                                               if ([network.SSID isEqualToString:@"ssid"]|| [network.SSID isEqualToString:@"test"]) {
                                                                   double signalStrength = network.signalStrength;
                                                                   NSLog(@"Signal Strength: %f", signalStrength);
                                                                   [network setConfidence:kNEHotspotHelperConfidenceHigh];
                                                                   [network setPassword:@"password"];
                                                                   NEHotspotHelperResponse *response = [cmd createResponse:kNEHotspotHelperResultSuccess];
                                                                   NSLog(@"Response CMD %@", response);
                                                                   [response setNetworkList:@[network]];
                                                                   [response setNetwork:network];
                                                                   [response deliver];
                                                               }
                                                           }
                                                       }
                                                   }];
    NSLog(@"result :%d", returnType);
    NSArray *array = [NEHotspotHelper supportedNetworkInterfaces];
    NSLog(@"wifiArray:%@", array);
    NEHotspotNetwork *connectedNetwork = [array lastObject];
    NSLog(@"supported Network Interface: %@", connectedNetwork);
}

//获取手机当前连接WiFi信息
- (NSString *)getWifiName {
    
    NSString *wifiName = nil;
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    if (!wifiInterfaces) {
        return @"未知";
    }
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    for (NSString *interfaceName in interfaces) {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        if (dictRef) {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            CFRelease(dictRef);
        }
    }
    CFRelease(wifiInterfaces);
    return wifiName;
}
@end














