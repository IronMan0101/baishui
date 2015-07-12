//
//  DBTool.m
//
//  Created by suzq on 14-7-31.
//
//  数据库帮助类
//

#import "DBTool.h"



@implementation DBTool


#define DB_NAME   @"hdm24.db"

//数据库是否存在
+(BOOL)isDBExist
{
   return [DBTool isDBExist:DB_NAME];
}
//数据库是否存在
+(BOOL)isDBExist:(NSString *)dbName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:dbName];
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL bExist = [fileManager fileExistsAtPath:dbPath];
    
    
    if(bExist)
    {
        [DBTool addSkipBackupAttributeToItemAtPath:dbPath];
    }
    return bExist;
}

//获取DB
+(FMDatabase *)getDB
{
    return   [DBTool  getDB:DB_NAME];
}

//获取DB
+(FMDatabase *)getDB:(NSString *)dbName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:dbName];
    
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    
    BOOL ret=[db open];
    
    if (ret)
    {
        NSLog(@"创建数据库成功...");
        //add by silence 20150625
        [DBTool addSkipBackupAttributeToItemAtPath:dbPath];
        
    }else
    {
        NSLog(@"创建数据库了失败...");
    }
    
    [db close];
    
    return db;
}

//add by silence 20150625
+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *) filePathString
{
    NSURL* URL= [NSURL fileURLWithPath: filePathString];
//    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    return success;
}


// 判断是否存在表
+(BOOL)isTableExist:(FMDatabase *)db  tableName:(NSString *)tableName
{
    FMResultSet *rs = [db executeQuery:@"SELECT count(*) as 'count' FROM sqlite_master WHERE type ='table' and name = ?", tableName];
    
    while ([rs next])
    {
        // just print out what we've got in a number of formats.
        NSInteger count = [rs intForColumn:@"count"];
        NSLog(@"isTableExist %ld", (long)count);
        
        if (0 == count)
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }
    return NO;
}

// 删除表
+ (BOOL)dropTable:(FMDatabase *)db  tableName:(NSString *)tableName
{
    NSString *sqlstr = [NSString stringWithFormat:@"DROP TABLE %@", tableName];
    
    if (![db executeUpdate:sqlstr])
    {
        NSLog(@"Delete table error!");
        return NO;
    }
    return YES;
}


// 清空表
+(BOOL)deleteTable:(FMDatabase *)db   tableName:(NSString *)tableName
{
    NSString *sqlstr = [NSString stringWithFormat:@"DELETE FROM %@", tableName];
    if (![db executeUpdate:sqlstr])
    {
        NSLog(@"deleteTable table error!");
        return NO;
    }
    return YES;
}



//获取表的记录数
+(BOOL)getTableCount:(FMDatabase *)db   tableName:(NSString *)tableName
{
    NSString *sqlstr = [NSString stringWithFormat:@"SELECT count(*) as 'count' FROM %@", tableName];
    
    NSInteger count=0;
    
    FMResultSet *rs = [db executeQuery:sqlstr];
    
    while ([rs next])
    {
        // just print out what we've got in a number of formats.
        count = [rs intForColumn:@"count"];
        NSLog(@"TableItemCount %ld", (long)count);
        return count;
    }
    
    return count;
}

// 创建表
+(BOOL)createTable:(FMDatabase *)db  tableName:(NSString *)tableName  arg:(NSString *)param
{
    NSString *sqlstr = [NSString stringWithFormat:@"CREATE TABLE if not exists %@ (%@)", tableName, param];
    if (![db executeUpdate:sqlstr])
    {
        NSLog(@"Create db error!");
        return NO;
    }
    
    return YES;
}

+(NSString *)getColomn:(FMResultSet *)rsQuery  col:(NSString*)col
{
    NSString *result=[NSString bc_removeNil:[rsQuery stringForColumn:col]];
    return  result;
}


//
//UINavigationController.view —>  UIViewController.view —>  UIScrollView —>  Screen and User's finger
//
//
//即UIScrollView的panGestureRecognizer先接收到了手势事件，直接就地处理而没有往下传递。
//



@end
