//
//  XYDatabase.h
//  FMDBTest
//
//  Created by qingsong on 15/6/3.
//  Copyright (c) 2015年 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"


@class FMDatabase;
@interface XYDatabase : NSObject

@property(nonatomic,strong)    FMDatabase * db;

/**
 *     单例
 *
 *     @return 返回单例对象
 */
+ (instancetype)shareDB;

/**
 *     SQL语句
 *
 *     @param sql   sql语句
 *     @param table 表名
 *
 *     @return 拼接字符串
 */
+ (NSString * )SQL:(NSString *)sql inTable:(NSString *)table;

/**
 *     创建表格
 *
 *     @param model 表名
 */
+ (void)createTable:(id)model;

@end
