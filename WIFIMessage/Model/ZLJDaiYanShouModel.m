//
//  ZLJDaiYanShouModel.m
//  DDAPP
//
//  Created by TomLong on 2019/6/13.
//  Copyright © 2019年 点都科技. All rights reserved.
//

#import "ZLJDaiYanShouModel.h"

@implementation ZLJYanShoufilePaths

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"kId":@"id"};
}
@end






@implementation ZLJDaiYanShouData
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"kId":@"id"};
}

+(NSDictionary *)mj_objectClassInArray{
    return @{@"filePaths":@"ZLJYanShoufilePaths"};
}

@end





@implementation ZLJDaiYanShouModel
+(NSDictionary *)mj_objectClassInArray{
    return @{@"data":[ZLJDaiYanShouData class]};
}


@end

