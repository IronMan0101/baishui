
#import "HDMClass.h"


@implementation HDMClass


/**
 *  映射
 */
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    
    return @{@"key": @"class_id",
             @"class_name": @"class_name",
             @"is_check": @"is_check",
             @"parent_id": @"parent_id"};
}



+ (NSDictionary *)databasePropertyMap;{
    
    return @{@"key": @"class_id",
             @"class_name": @"",
             @"is_check": @"",
             @"parent_id": @""};
}

@end



