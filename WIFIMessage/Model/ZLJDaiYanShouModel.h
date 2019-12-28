//
//  ZLJDaiYanShouModel.h
//  DDAPP
//
//  Created by TomLong on 2019/6/13.
//  Copyright © 2019年 点都科技. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLJYanShoufilePaths : NSObject

@property (nonatomic , copy) NSString              * files;
@property (nonatomic , copy) NSString              * kId;
@end






@interface ZLJDaiYanShouData : NSObject

@property (nonatomic , copy) NSString              * coorDepName;
@property (nonatomic , copy) NSString              * maintenancePerson;
@property (nonatomic , copy) NSString              * criterionCode;
@property (nonatomic , copy) NSString              * maintenanceLevel;
@property (nonatomic , copy) NSString              * deviceName;//设备名字
@property (nonatomic , copy) NSString              * deviceId;//设备id
@property (nonatomic , copy) NSString              * maintenanceText;
@property (nonatomic , copy) NSString              * codeId;
@property (nonatomic , copy) NSString              * coortext;
@property (nonatomic , copy) NSString              * taketime;//开始时间
@property (nonatomic , copy) NSString              * losetime;//结束时间
@property (nonatomic , copy) NSString              * spaceLocation;//空间位置
@property (nonatomic , copy) NSString              * kId;
@property (nonatomic , assign) NSInteger              maintenanceType;
@property (nonatomic , copy) NSString              * syTime;//剩余时间
@property (nonatomic,retain) ZLJYanShoufilePaths *filePaths;//图片路径

//无网提交数据
@property (nonatomic , copy) NSString                 *daitijiao;//daitijiao == @"待提交"  -- 未提交

@end









@interface ZLJDaiYanShouModel : NSObject

@property (nonatomic , assign) BOOL              state;
@property (nonatomic , copy) NSString              * time;
@property (nonatomic , strong) NSMutableArray <ZLJDaiYanShouData *> * data;
@end

NS_ASSUME_NONNULL_END
