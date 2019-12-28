//
//  RuntimVC.m
//  ShoppingTestDemo
//
//  Created by TomLong on 2019/3/14.
//  Copyright © 2019年 longjie. All rights reserved.
//

#import "RuntimVC.h"
#import <objc/runtime.h>
@interface RuntimVC ()

@end

@implementation RuntimVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
//    UITableView
    
}

//私有属性遍历
- (void)privatePropertyList{
    
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([UIView class], &outCount);
    for (NSInteger i = 0; i < outCount; ++i) {
        // 遍历取出该类成员变量
        Ivar ivar = *(ivars + i);
        NSLog(@"\n name = %s  \n type = %s", ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    }
    free(ivars);// 根据内存管理原则释放指针
}


@end
