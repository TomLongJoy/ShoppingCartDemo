//
//  XYDatabase.m
//  FMDBTest
//
//  Created by qingsong on 15/6/3.
//  Copyright (c) 2015年 qingsong. All rights reserved.
//


#import <objc/runtime.h>
#import "XYDatabase.h"


#define QIPuDB  @"zlj_fmdn.db"

@implementation XYDatabase
@synthesize db;
static FMDatabase *_fmdb;
static XYDatabase *XYDB;;

+ (instancetype)shareDB{
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:QIPuDB];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        XYDB = [[XYDatabase alloc]init];
        });
    return XYDB;
}


- (instancetype)init{
    self = [super init];
    if (self) {
        BOOL success;
           NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:QIPuDB];
        db = [FMDatabase databaseWithPath:filePath];
        if ([db open]) {
            [db setShouldCacheStatements:YES];
                }else {
                   success = NO;
        }
    }
    return self;
}


+ (void)initialize {
    // 执行打开数据库和创建表操作
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:QIPuDB];
    _fmdb = [FMDatabase databaseWithPath:filePath];
    if ([_fmdb open]) {
        [_fmdb setShouldCacheStatements:YES];
    }else {
    }
}

+ (NSString *)SQL:(NSString *)sql inTable:(NSString *)table{
    return [NSString stringWithFormat:sql,table];
}

/**
 *     创建数据库表
 *
 *     @param model 表名字 可以是一个model的类名
 */
+ (void)createTable:(id)model
{
    NSString * sql;
    NSString *   tableName =  [NSString stringWithUTF8String:object_getClassName(model)];
    //啦啦
    u_int count;
    objc_property_t *properties  =class_copyPropertyList([model class], &count);
    NSString * vlues = @"";
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName =property_getName(properties[i]);
            if (i == 0) {
            vlues = [NSString stringWithFormat:@"'%@'TEXT", [NSString stringWithUTF8String: propertyName]] ;
        }
        else
        {
            vlues = [NSString stringWithFormat:@"%@,'%@'TEXT",vlues, [NSString stringWithUTF8String: propertyName]];
        }
    }
    free(properties);
    if (![_fmdb tableExists:tableName]) {
        sql = [NSString stringWithFormat: @"CREATE TABLE IF NOT EXISTS '%@' ('index' INTEGER PRIMARY KEY AUTOINCREMENT,%@)",tableName,vlues];
        [_fmdb executeUpdate:sql];
    //        NSLog(@"表格创建成功");
    }
}

@end
