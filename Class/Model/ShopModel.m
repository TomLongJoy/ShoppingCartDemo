//
//  ShopModel.m
//  ShoppingTestDemo
//
//  Created by 赵龙杰 on 2018/1/19.
//  Copyright © 2018年 longjie. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"reasonlist":[ShopGoodsListModel class]};
}
@end
//

@implementation ShopGoodsListModel

@end
