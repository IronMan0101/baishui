//
//  HDMChannelReMenFirstManager.h
//  HDMProject
//
//  Created by suzq on 14-10-10.
//
//

#import <Foundation/Foundation.h>
#import "PCCommonTypes.h"

@interface HDMChannelReMenFirstManager : BCManager
{
    
}

@property (nonatomic) HDMChannel channel;
@property (nonatomic,strong) NSMutableArray *arryBanner;

- (void)refreshData:(NSURLSessionDataTask *)task Obj:(id)responseObject Success:(void (^)(NSDictionary *codeMsg))success Failure:(void (^)(NSDictionary *codeMsg))failure;

@end
