//
//  NSDate+BCCategory.m
//  
//
//  Created by Sea on 14-5-23.
//
//

#import "NSDate+BCCategory.h"


static NSDateFormatter *dateFormatter = nil;//内存管理(唯一)


@implementation NSDate (BCCategory)


- (NSString *)bc_microsecondTimeIntervalSince1970 {
    
    NSTimeInterval interval = [self timeIntervalSince1970];
    return [NSString stringWithFormat:@"%13.0f", interval*1000.0f];
}


+ (NSString *)subStringBaseOnToday:(NSString *)dateString {
    
    if (!dateFormatter)
    {
        dateFormatter = [[NSDateFormatter alloc] init];
    }
    
    NSDate * today = [NSDate date];
    
    //2014-01-09 23:28:08
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date = [dateFormatter dateFromString:dateString];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString * dateYMD = [dateFormatter stringFromDate:date];
    NSString * todayYMD = [dateFormatter stringFromDate:today];
    if ([dateYMD isEqualToString:todayYMD])
    {// 今天
        NSTimeInterval timeInterval = [date timeIntervalSinceNow];
        NSInteger minute = (-timeInterval)/60;
        
        if (minute<=0)
        {
            return @"刚刚";
        }
        else
        {
            if (minute<60)
            {
                return [NSString stringWithFormat:@"%ld分钟前", (long)minute];
            }
            else
            {
                return [NSString stringWithFormat:@"%ld小时前", (long)(minute/60)];
            }
        }
    }
    else
    {
        [dateFormatter setDateFormat:@"yyyy"];
        NSString * dateY = [dateFormatter stringFromDate:date];
        NSString * todayY = [dateFormatter stringFromDate:today];
        if ([dateY isEqualToString:todayY])
        {// 今年
            [dateFormatter setDateFormat:@"MM-dd HH:mm"];
            return [dateFormatter stringFromDate:date];
        }
        else
        {
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            return [dateFormatter stringFromDate:date];
        }
    }
    
    return nil;
}


- (NSString *)stringWithFormat:(NSString *)format;{
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    NSString * dateString = [dateFormatter stringFromDate:self];
    
    dateFormatter = nil;
    
    return dateString;
}

- (NSTimeInterval)bc_timeIntervalSince1970WithDateFormat:(NSString *)format;{
    
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];//@"yyyyMMdd"
    
    NSString * dateString = [dateFormatter stringFromDate:self];
    
    NSDate * dateFromString = [dateFormatter dateFromString:dateString];
    
    NSTimeInterval timeInterval = [dateFromString timeIntervalSince1970];
    
    return timeInterval;
}


+ (NSString *)bc_timeIntervalSince1970IntPartString;{
    
    return [NSString stringWithFormat:@"%@", [NSNumber numberWithInt:[[NSDate date] timeIntervalSince1970]]];
}


+ (NSString *)bc_dateStringWithFormat:(NSString *)format;{
    
    return [[NSDate date] stringWithFormat:format];
}


@end
