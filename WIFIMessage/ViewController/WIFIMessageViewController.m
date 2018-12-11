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
@interface WIFIMessageViewController ()

@end

@implementation WIFIMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self getWifiList];
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














