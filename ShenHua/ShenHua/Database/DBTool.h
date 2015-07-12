//
//  DBTool.h
//
//  Created by suzq on 14-7-31.
//
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DBTool : NSObject

//数据库是否存在
+(BOOL)isDBExist;
//数据库是否存在
+(BOOL)isDBExist:(NSString *)dbName;
//获取DB对象
+(FMDatabase *)getDB;
//获取DB对象
+(FMDatabase *)getDB:(NSString *)dbName;
//add by silence 20150625  设置成离线属性
+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *) filePathString;

// 判断是否存在表
+(BOOL)isTableExist:(FMDatabase *)db   tableName:(NSString *)tableName;
// 删除表
+ (BOOL)dropTable:(FMDatabase *)db      tableName:(NSString *)tableName;
//获取表的记录数
+(BOOL)getTableCount:(FMDatabase *)db   tableName:(NSString *)tableName;
// 清空表
+(BOOL)deleteTable:(FMDatabase *)db   tableName:(NSString *)tableName;



// 创建表
//Name text  primary key ,Age integer,
+(BOOL)createTable:(FMDatabase *)db  tableName:(NSString *)tableName  arg:(NSString *)param;

+(NSString *)getColomn:(FMDatabase *)rsQuery  col:(NSString*)col;

@end
