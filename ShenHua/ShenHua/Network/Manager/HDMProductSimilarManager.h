//
//  HDMProductSelManager.h
//  HDMProject
//
//  Created by gyfd on 14-10-31.
//
//

#import <Foundation/Foundation.h>

@interface HDMProductSimilarManager : BCManager


@property (nonatomic,copy)   NSString *chann_id;
@property (nonatomic,copy)   NSString * opus_id;
@property (nonatomic,strong) NSMutableArray * contentRecom;//推荐
@property (nonatomic,strong) NSMutableArray * contentGuess;//猜你喜欢

@end
