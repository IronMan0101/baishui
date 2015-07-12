//
//  HDMBookmarkManager.h
//  PCCommon
//
//  Created by Sea on 14-7-27.
//
//

#import <Foundation/Foundation.h>
#import "HDMNetwork.h"

@interface HDMBookmarkManager : BCManager
{
    
}

@property (nonatomic, assign) HDMChannel channel;

- (void)deleteBookmarkList:(NSArray *)bookmarkList Success:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;

- (void)clearSuccess:(void (^)(NSDictionary *))success Failure:(void (^)(NSDictionary *))failure;

@end
