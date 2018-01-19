//
//  ShopModel.h
//  ShoppingTestDemo
//
//  Created by 赵龙杰 on 2018/1/19.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShopGoodsListModel;
@interface ShopModel : NSObject
@property (nonatomic,strong)    NSMutableArray  <ShopGoodsListModel *>*reasonlist;

@end

@interface ShopGoodsListModel : NSObject

@property (nonatomic,copy)      NSString    *reasonName;

@property (nonatomic,assign)    BOOL    selectedStatus;

@end
