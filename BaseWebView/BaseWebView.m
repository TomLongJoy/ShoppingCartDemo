//
//  BaseWebView.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2019/4/24.
//  Copyright © 2019年 longjie. All rights reserved.
//

#import "BaseWebView.h"
#import <WMPageController.h>
#import "BaseUIWebViewVC.h"
#import "BaseWKWebViewVC.h"
#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define kHEIGHT [UIScreen mainScreen].bounds.size.height

@interface BaseWebView ()

@property (nonatomic, strong) WMPageController *pageController;

@end

@implementation BaseWebView

- (void)viewDidLoad {
    self.title = @"webview";
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
        return [BaseUIWebViewVC new];
    }else {
        return [BaseWKWebViewVC new];
    }
    
}
//设置每个viewcontroller的标题
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    if (index == 0) {
        return @"uiwebview";
    }
    return @"wkwebview";
}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView{
    return CGRectMake(0, 88, KWIDTH, 52);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView{
    
    return CGRectMake(0, 141, KWIDTH, kHEIGHT - 141);
    
}
@end
