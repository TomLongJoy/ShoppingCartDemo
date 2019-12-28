
//
//  Created by WangShuai on 14-9-19.
//  Copyright (c) 2014年 Shawn Yao. All rights reserved.
//

#import "BaseModel.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "FMDatabaseAdditions.h"


#define QIPuDB  @"zlj_fmdn.db"

@implementation BaseModel

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
#pragma mark 找出所有的数据
+ (NSMutableArray *)searchBySql:(NSString *)SQL table:(id)tableName{
    
    NSString * table = [NSString stringWithUTF8String:object_getClassName(tableName)];
    NSMutableArray *reslute = [[NSMutableArray alloc]initWithCapacity:0];
    NSMutableString *sql = [NSMutableString stringWithString:[XYDatabase SQL:@"SELECT * FROM %@ " inTable:table]];
    
    if (SQL != nil) {
        [sql appendString:SQL];
    }

    [[XYDatabase shareDB].db open];
 
    
    FMResultSet *rs = [[XYDatabase shareDB].db executeQuery:sql];
    
    while ([rs next]) {
        
        u_int count;
        
        objc_property_t *properties  =class_copyPropertyList([tableName class], &count);
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < count ; i++)
        {
            const char* propertyName =property_getName(properties[i]);
            [dic setValue:[rs stringForColumn:[NSString stringWithUTF8String: propertyName]]  forKey:[NSString stringWithUTF8String: propertyName]];
        }
        id returnModel = [[[tableName class] alloc] init];
        [returnModel setValuesForKeysWithDictionary:dic];
        [reslute addObject:returnModel];
    }
    
    [rs close];
    [[XYDatabase shareDB].db close];
    if (!reslute || reslute.count <= 0) {
        return nil;
    }
    return reslute;
}




+ (NSMutableArray *)searchBySqlWithQueue:(NSString *)SQL table:(id)tableName{
    
    NSString * table = [NSString stringWithUTF8String:object_getClassName(tableName)];
  __block  NSMutableArray *reslute = [[NSMutableArray alloc]initWithCapacity:0];
    NSMutableString *sql = [NSMutableString stringWithString:[XYDatabase SQL:@"SELECT * FROM %@ " inTable:table]];
    
    if (SQL != nil) {
        [sql appendString:SQL];
    }
    
    NSString *dbFilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:QIPuDB];
    FMDatabaseQueue *dkdk = [FMDatabaseQueue databaseQueueWithPath:dbFilePath];
    [dkdk inDatabase:^(FMDatabase *db) {
        
          FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            
            u_int count;
            
            objc_property_t *properties  =class_copyPropertyList([tableName class], &count);
            NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
            
            for (int i = 0; i < count ; i++)
            {
                const char* propertyName =property_getName(properties[i]);
                [dic setValue:[rs stringForColumn:[NSString stringWithUTF8String: propertyName]]  forKey:[NSString stringWithUTF8String: propertyName]];
            }
            id returnModel = [[[tableName class] alloc] init];
            [returnModel setValuesForKeysWithDictionary:dic];
            [reslute addObject:returnModel];
        }
        [rs close];
    }];
    

  
    if (!reslute || reslute.count <= 0) {
        return nil;
    }
    return reslute;
}

+ (NSMutableArray *)searchdistinctBySql:(NSString *)SQL table:(id)tableName
{
    NSMutableArray *reslute = [[NSMutableArray alloc]initWithCapacity:0];

    [[XYDatabase shareDB].db open];
    FMResultSet *rs = [[XYDatabase shareDB].db executeQuery:SQL];
    
    while ([rs next]) {
        
        u_int count;
        
        objc_property_t *properties  =class_copyPropertyList([tableName class], &count);
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < count ; i++)
        {
            const char* propertyName =property_getName(properties[i]);
            [dic setValue:[rs stringForColumn:[NSString stringWithUTF8String: propertyName]]  forKey:[NSString stringWithUTF8String: propertyName]];
        }
        id returnModel = [[[tableName class] alloc] init];
        [returnModel setValuesForKeysWithDictionary:dic];
        [reslute addObject:returnModel];
    }
    
    [rs close];
    [[XYDatabase shareDB].db close];
    if (!reslute || reslute.count <= 0) {
        return nil;
    }
    return reslute;
}

+ (NSMutableArray *)searchOrderBySql:(NSString *)SQL table:(id)tableName{
 
    NSMutableArray *reslute = [[NSMutableArray alloc]initWithCapacity:0];
    [[XYDatabase shareDB].db open];
    FMResultSet *rs = [[XYDatabase shareDB].db executeQuery:SQL];
    
    while ([rs next]) {
        
        u_int count;
        
        objc_property_t *properties  =class_copyPropertyList([tableName class], &count);
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < count ; i++)
        {
            const char* propertyName =property_getName(properties[i]);
            [dic setValue:[rs stringForColumn:[NSString stringWithUTF8String: propertyName]]  forKey:[NSString stringWithUTF8String: propertyName]];
        }
        id returnModel = [[[tableName class] alloc] init];
        [returnModel setValuesForKeysWithDictionary:dic];
        [reslute addObject:returnModel];
    }
    
    [rs close];
    [[XYDatabase shareDB].db close];
    if (!reslute || reslute.count <= 0) {
        return nil;
    }
    return reslute;
}


+ (id)findFirstBySQL:(NSString *)SQL table:(id)tableName
{
    NSString * table = [NSString stringWithUTF8String:object_getClassName(tableName)];
    NSMutableArray *result = [[NSMutableArray alloc]initWithCapacity:0];
    NSMutableString *sql = [NSMutableString stringWithString:[XYDatabase SQL:@"SELECT * FROM %@ " inTable:table]];
    if (SQL !=nil) {
        [sql appendString:SQL];
    }
    [[XYDatabase shareDB].db open];
    FMResultSet *rs = [[XYDatabase shareDB].db executeQuery:sql];
    while ([rs next]) {
        
        u_int count;
        
        objc_property_t *properties  =class_copyPropertyList([tableName class], &count);
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < count ; i++)
        {
            const char* propertyName =property_getName(properties[i]);
            [dic setValue:[rs stringForColumn:[NSString stringWithUTF8String: propertyName]]  forKey:[NSString stringWithUTF8String: propertyName]];
        }
        id returnModel = [[[tableName class] alloc] init];
        [returnModel setValuesForKeysWithDictionary:dic];
        [result addObject:returnModel];
    }
    [rs close];
    [[XYDatabase shareDB].db close];
    if ([result count]>0) {
        return [result objectAtIndex:0];
    }else {
        return nil;
    }
}

+ (id)findFirstBySQLWithQueue:(NSString *)SQL table:(id)tableName
{
    NSString * table = [NSString stringWithUTF8String:object_getClassName(tableName)];
    NSMutableArray *result = [[NSMutableArray alloc]initWithCapacity:0];
    NSMutableString *sql = [NSMutableString stringWithString:[XYDatabase SQL:@"SELECT * FROM %@ " inTable:table]];
    if (SQL !=nil) {
        [sql appendString:SQL];
    }
    [[XYDatabase shareDB].db open];
    NSString *dbFilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:QIPuDB];
    FMDatabaseQueue *dkdk = [FMDatabaseQueue databaseQueueWithPath:dbFilePath];
    [dkdk inDatabase:^(FMDatabase *db) {
        
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            
            u_int count;
            
            objc_property_t *properties  =class_copyPropertyList([tableName class], &count);
            NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
            
            for (int i = 0; i < count ; i++)
            {
                const char* propertyName =property_getName(properties[i]);
                [dic setValue:[rs stringForColumn:[NSString stringWithUTF8String: propertyName]]  forKey:[NSString stringWithUTF8String: propertyName]];
            }
            id returnModel = [[[tableName class] alloc] init];
            [returnModel setValuesForKeysWithDictionary:dic];
            [result addObject:returnModel];
        }
        [rs close];
    }];

    [[XYDatabase shareDB].db close];
    if ([result count]>0)
    {
        return [result objectAtIndex:0];
    }else {
        return nil;
    }
}

+ (NSInteger)countBySQL:(NSString *)SQL table:(id)tableName
{
    NSString * table = [NSString stringWithUTF8String:object_getClassName(tableName)];
    NSInteger count = 0;
    NSMutableString *sql = [NSMutableString stringWithString:[XYDatabase SQL:@"SELECT COUNT(*) FROM %@ " inTable:table]];
    
    if (SQL != nil) {
        [sql appendString:SQL];
    }
    
    NSLog(@"sql %@",sql);
    
    [[XYDatabase shareDB].db open];
    
    FMResultSet *rs = [[XYDatabase shareDB].db executeQuery:sql];
    
    while ([rs next])
    {
        count = [rs intForColumnIndex:0];
    }
    
    [rs close];
    
    [[XYDatabase shareDB].db close];
    
    return count;
}

#pragma mark 插入数据
+ (void)insertBySQL:(id)tableName
{
    NSString * table = [NSString stringWithUTF8String:object_getClassName(tableName)];
    //啦啦
    u_int count;
    
    objc_property_t *properties  =class_copyPropertyList([tableName class], &count);
    
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    NSString * selname = @"";
    NSString * vlues = @"";
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        
        if (i == 0) {
            selname = [NSString stringWithUTF8String: propertyName];
            vlues = [NSString stringWithFormat:@"'%@'",[tableName valueForKey:[NSString stringWithUTF8String: propertyName]]] ;
        }
        else
        {
            selname =[NSString stringWithFormat:@"%@,%s",selname,propertyName];
            vlues = [NSString stringWithFormat:@"%@,'%@'",vlues,[tableName valueForKey:[NSString stringWithUTF8String: propertyName]]];
            [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
        }
    }
    
    free(properties);
    
    [[XYDatabase shareDB].db open];
    [[XYDatabase shareDB].db beginTransaction];
    
    NSString * insertSql = [NSString stringWithFormat:@"INSERT OR IGNORE INTO '%@' (%@) VALUES (%@)",table,selname,vlues];
    

    [[XYDatabase shareDB].db executeUpdate:insertSql];

    [[XYDatabase shareDB].db commit];
    [[XYDatabase shareDB].db close];
}


+ (void)insertBySQLWithQueue:(id)tableName
{
    NSString * table = [NSString stringWithUTF8String:object_getClassName(tableName)];
    //啦啦
    u_int count;
    
    objc_property_t *properties  =class_copyPropertyList([tableName class], &count);
    
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    NSString * selname = @"";
    NSString * vlues = @"";
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        
        if (i == 0) {
            selname = [NSString stringWithUTF8String: propertyName];
            vlues = [NSString stringWithFormat:@"'%@'",[tableName valueForKey:[NSString stringWithUTF8String: propertyName]]] ;
        }
        else
        {
            selname =[NSString stringWithFormat:@"%@,%s",selname,propertyName];
            vlues = [NSString stringWithFormat:@"%@,'%@'",vlues,[tableName valueForKey:[NSString stringWithUTF8String: propertyName]]];
            [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
        }
    }
    
    free(properties);
    
    
    NSString * insertSql = [NSString stringWithFormat:@"INSERT OR IGNORE INTO '%@' (%@) VALUES (%@)",table,selname,vlues];
    
    
    [[XYDatabase shareDB].db open];
    NSString *dbFilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:QIPuDB];
    FMDatabaseQueue *dkdk = [FMDatabaseQueue databaseQueueWithPath:dbFilePath];
    [dkdk inDatabase:^(FMDatabase *db)
    {
        BOOL result = [db executeUpdate:insertSql];
        if (result)
        {
           // NSLog(@"插入数据成功");
        }
        
         [db close];
    }];

}

#pragma mark 更新当前的数据
+ (BOOL)updateBySQL:(NSString *)SQL table:(id)tableName
{
//    NSString * updateSQL = [NSString stringWithFormat:@"unReadCount = '%@' where userID = '%@' and chatterID = '%@' and msgType = '%@' or msgType = '%@' and userID = '%@' and chatterID = '%@'",@"0",[CommonModelDao getUserId],chatter,type,@"3",[CommonModelDao getUserId],chatter];

    
    NSString * table = [NSString stringWithUTF8String:object_getClassName(tableName)];
    BOOL success = YES;
    [[XYDatabase shareDB].db open];
    // personid = ? WHERE 'index' = ?
    NSString *updateSQL = [NSString stringWithFormat:@"UPDATE %@ SET %@",table,SQL];
    [[XYDatabase shareDB].db executeUpdate:updateSQL];
    if ([[XYDatabase shareDB].db hadError]) {
        NSLog(@"Err %d: %@",[[XYDatabase shareDB].db lastErrorCode],[[XYDatabase shareDB].db lastErrorMessage]);
        success = NO;
    }else {
        [[XYDatabase shareDB].db clearCachedStatements];
    }
    [[XYDatabase shareDB].db close];
    return success;
}

+ (BOOL)updateBySQLWithQueue:(NSString *)SQL table:(id)tableName
{
    //    NSString * updateSQL = [NSString stringWithFormat:@"unReadCount = '%@' where userID = '%@' and chatterID = '%@' and msgType = '%@' or msgType = '%@' and userID = '%@' and chatterID = '%@'",@"0",[CommonModelDao getUserId],chatter,type,@"3",[CommonModelDao getUserId],chatter];
    
    
    NSString * table = [NSString stringWithUTF8String:object_getClassName(tableName)];
 __block   BOOL success = YES;
    NSString *dbFilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:QIPuDB];
    FMDatabaseQueue *dkdks = [FMDatabaseQueue databaseQueueWithPath:dbFilePath];
    
    
    [dkdks inDatabase:^(FMDatabase *db) {
        NSString *updateSQL = [NSString stringWithFormat:@"UPDATE %@ SET %@",table,SQL];
        [db executeUpdate:updateSQL];
        if ([db hadError]) {
            NSLog(@"Err %d: %@",[db lastErrorCode],[db lastErrorMessage]);
            success = NO;
        }else {
            [db clearCachedStatements];
        }
        
    }];
//    [[XYDatabase shareDB].db open];
    // personid = ? WHERE 'index' = ?
   
    return success;
}

+ (BOOL)deleteBySQL:(NSString *)SQL table:(id)tablename
{
    NSString * table = [NSString stringWithUTF8String:object_getClassName(tablename)];
    BOOL success = YES;
    [[XYDatabase shareDB].db open];
    NSString *delSQL = [NSString stringWithFormat:@"DELETE FROM %@ %@ ",table,SQL];
    [[XYDatabase shareDB].db executeUpdate:delSQL];
    
    if ([[XYDatabase shareDB].db hadError]) {
        NSLog(@"Err %d: %@",[[XYDatabase shareDB].db lastErrorCode],[[XYDatabase shareDB].db lastErrorMessage]);
        success = NO;
    }else {
        [[XYDatabase shareDB].db clearCachedStatements];
    }
    [[XYDatabase shareDB].db close];
    
    return success;
}

+ (BOOL)deleteBySQLWithQueue:(NSString *)SQL table:(id)tablename
{
    NSString * table = [NSString stringWithUTF8String:object_getClassName(tablename)];
    [[XYDatabase shareDB].db open];
    NSString *delSQL = [NSString stringWithFormat:@"DELETE FROM %@ %@ ",table,SQL];
    
    NSString *dbFilePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:QIPuDB];
    FMDatabaseQueue *dkdks = [FMDatabaseQueue databaseQueueWithPath:dbFilePath];
    
    __block BOOL result = NO;
    [dkdks inDatabase:^(FMDatabase *db)
     {
        result =   [db executeUpdate:delSQL];
        if ([db hadError])
        {
            NSLog(@"Err %d: %@",[db lastErrorCode],[db lastErrorMessage]);
        }else
        {
            [db clearCachedStatements];
        }
     }];
    [[XYDatabase shareDB].db close];
    
    return result;
}


@end
