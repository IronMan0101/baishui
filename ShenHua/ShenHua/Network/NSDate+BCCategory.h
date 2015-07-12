//
//  NSDate+BCCategory.h
//  
//
//  Created by Sea on 14-5-23.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (BCCategory)

- (NSString *)bc_microsecondTimeIntervalSince1970;

+ (NSString *)subStringBaseOnToday:(NSString *)dateString;

+ (NSString *)bc_dateStringWithFormat:(NSString *)format;

- (NSTimeInterval)bc_timeIntervalSince1970WithDateFormat:(NSString *)format;

+ (NSString *)bc_timeIntervalSince1970IntPartString;

@end
