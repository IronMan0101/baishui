
#import <Foundation/Foundation.h>
#import "HDMZone.h"


@interface HDMUserZoneManager : BCManager
{
    
}

+ (instancetype)sharedInstance;

@property (nonatomic, strong) HDMZone * reviewZone;
@property (nonatomic, strong) HDMZone * creditZone;
@property (nonatomic, strong) HDMZone * packageZone;
@property (nonatomic, strong) HDMZone * currencyZone;

@end
