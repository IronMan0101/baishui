//
//  BCModel.m
//  
//
//  Created by Sea on 14-5-23.
//
//

#import <objc/runtime.h>

#import "BCModel.h"



@implementation BCModel

@synthesize modelTag = _modelTag;


/**
 *  1.如果属性名和JSON的键名一致时，是可以省略不写映射的
 *  mantle实战
 *  http://www.tuicool.com/articles/iYrye2Q
 *  https://github.com/ipinka/AvoidMTLModelCrash
 */




/** 解决json返回带有脏数据
 *  {
 *    "copyToChina": null
 *  }
 *
 */
- (void)setNilValueForKey:(NSString *)key
{
    [self setValue:@0 forKey:key];  // For NSInteger/CGFloat/BOOL
}


/**
 *  子类必须实现继承
 *
 *  @return <#return value description#>  实体:JSON
 */
+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    
    return @{@"": @""};
}

/**
 *  iOS中处理URL使用的是NSURL类型，但JSON只支持基本的字符串
 *
 */
+ (NSValueTransformer *)URLJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}



//例如某些接口返回的数据是数组，但很多时候只需要用到这个数组的第一个元素。我们可以直接将数组里面的一个元素影射出来。
// + (NSValueTransformer *)pointListJSONTransformer
//{
//    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray *array) {
//            return [array firstObject];
//        }];
//
//
//}

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    self = [super init];
    if (self)
    {
        [self propertyWithAttributes:attributes];
    }
    
    return self;
}

- (void)propertyWithAttributes:(NSDictionary *)attributes {
    
    [self propertyWithAttributes:attributes andKeys:[attributes allKeys]];
}


- (void)propertyWithAttributes:(NSDictionary *)attributes andKeys:(NSArray *)keys {
    
    for (NSString *key in keys)
    {
        @try
        {
            id object = [attributes valueForKey:key];
            if (object==nil || [object isKindOfClass:[NSNull class]])
            {
                ;
            }
            else
            {
                if ([key isEqualToString:@"description"])
                {
                    [self setValue:[attributes valueForKey:key] forKey:@"iDescription"];
                }
                else
                {
                    [self setValue:[attributes valueForKey:key] forKey:key];
                }
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"exception key: %@", key);
            NSLog(@"exception:%@", exception);
        }
        @finally
        {
            ;
        }
    }
    
    [self do_afterPropertyWithAttributes];
}


- (void)do_afterPropertyWithAttributes;{
    
}

- (void)dealloc;{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (NSDictionary *)attributes;{
    
    unsigned int outCount;
    objc_property_t * properties = class_copyPropertyList([self class], &outCount);
    
    NSMutableDictionary * propertiesDictionary = [[NSMutableDictionary alloc] initWithCapacity:outCount];
    for (int i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        
        const char * c_propertyName = property_getName(property);
        if (c_propertyName)
        {
            NSString * propertyName = [NSString stringWithUTF8String:c_propertyName];
            [propertiesDictionary setValue:[self valueForKey:propertyName] forKey:propertyName];
        }
    }
    
    free(properties);
    
    return propertiesDictionary;
}


- (NSString *)description;{
    
    NSMutableString * description = [NSMutableString string];
    
    unsigned int outCount, i;
    
    objc_property_t * properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++)
    {
        objc_property_t property = properties[i];
        const char * propName = property_getName(property);
        if (propName)
        {
            NSString * propertyName = [NSString stringWithUTF8String:propName];
            [description appendFormat:@"%@: %@\n", propertyName, [self valueForKey:propertyName]];
        }
    }
    free(properties);
    
    return description;
}


@end
