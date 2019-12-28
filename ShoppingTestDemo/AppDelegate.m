//
//  AppDelegate.m
//  ShoppingTestDemo
//
//  Created by 赵龙杰 on 2018/1/18.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "AppDelegate.h"
#import <AvoidCrash/AvoidCrash.h>
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

        
    ViewController  *vc = [[ViewController alloc] init];
//    ViewController  *vc_01 = [[ViewController alloc] init];
//    ViewController  *vc_02 = [[ViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc];
//    UINavigationController *navController = [[UINavigationController alloc] initWithNavigationBarClass:[UINavigationBar class] toolbarClass:[UIToolbar class]];
//    navController.viewControllers = @[vc,vc_01,vc_02];
    self.window.rootViewController = navController;
#if TARGET_IPHONE_SIMULATOR
    //模拟器  -(void)injected {}
    [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection10.bundle"] load];
#else
    
#endif
    return YES;
}

- (void)creashMessage:(NSNotification *)notification{
    NSLog(@"%@",notification);
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
