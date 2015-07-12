//
//  HDMProductSelManager.h
//  HDMProject
//
//  Created by gyfd on 14-10-31.
//
//

#import <Foundation/Foundation.h>

@class HDMProduct;

@interface HDMProductSelManager : BCManager

@property (nonatomic,strong) HDMProduct * product;
@property (nonatomic,copy)   NSString *chann_id;
@property (nonatomic,copy)   NSString * opus_id;

@end
