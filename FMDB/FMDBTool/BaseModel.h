
//
//  Created by WangShuai on 14-9-19.
//  Copyright (c) 2014年 Shawn Yao. All rights reserved.
//

#import "XYDatabase.h"
#import <objc/runtime.h>

@interface BaseModel : XYDatabase

// SELECT 找到所有的数据
+ (NSMutableArray *)searchBySql:(NSString *)SQL table:(id)tableName;

//搜索 distant数据
+ (NSMutableArray *)searchdistinctBySql:(NSString *)SQL table:(id)tableName;

+ (NSMutableArray *)searchOrderBySql:(NSString *)SQL table:(id)tableName;

//根据条件搜索，找到最新的那条数据
+ (id)findFirstBySQL:(NSString *)SQL table:(id)tableName;

//找到对应数据的条数
+ (NSInteger)countBySQL:(NSString *)SQL table:(id)tableName;

// INSERT   插入新数据
+ (void)insertBySQL:(id)tableName;

//更新数据
+ (BOOL)updateBySQL:(NSString *)SQL table:(id)tableName;

//删除数据
+ (BOOL)deleteBySQL:(NSString *)SQL table:(id)tablename;

+ (NSMutableArray *)searchBySqlWithQueue:(NSString *)SQL table:(id)tableName;
+ (BOOL)updateBySQLWithQueue:(NSString *)SQL table:(id)tableName;


+ (void)insertBySQLWithQueue:(id)tableName;

+ (BOOL)deleteBySQLWithQueue:(NSString *)SQL table:(id)tablename;

+ (id)findFirstBySQLWithQueue:(NSString *)SQL table:(id)tableName;
@end
