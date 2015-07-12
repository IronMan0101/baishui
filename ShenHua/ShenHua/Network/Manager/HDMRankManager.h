//
//  HDMRankManager.h
//  HDMProject
//
//  Created by suzq on 14/11/3.
//
//

#import <Foundation/Foundation.h>

#import "PCCommonTypes.h"

@interface HDMRankManager : BCManager

@property(nonatomic,assign) HDMChannel channel;

@property(nonatomic,copy) NSString * order_by;
@property(nonatomic,copy) NSString * rank_id;



@end
