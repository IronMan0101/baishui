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


+ (instancetype)testInstance;{
    
    return nil;
}

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
