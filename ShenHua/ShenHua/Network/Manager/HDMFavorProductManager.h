//
//  HDMFavorProductManager.h
//  PCCommon
//
//  Created by Sea on 14-7-27.
//
//

#import <Foundation/Foundation.h>
#import "HDMNetwork.h"

@interface HDMFavorProductManager : BCManager
{
    
}

@property (nonatomic, copy) NSString * channel;

- (void)clearSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;

@end
