
#import <Foundation/Foundation.h>

/*!
 *  频道
 */
typedef NS_ENUM (NSUInteger, HDMChannel)
{
    /*!
     *  全部
     */
    HDMAllChannel =0,
    
    /*!
     *  漫画
     */
    HDMManHuaChannel = 2,
    
    /*!
     *  动画
     */
    HDMDongHuaChannel = 4,
};

typedef NS_ENUM (NSUInteger, HDMViewModel)
{
    HDMViewModel_Edit,
    HDMViewModel_Normal,
    HDMViewModel_Download,
};

typedef NS_ENUM (NSUInteger, HDMSectionTag)
{
    HDMSectionTag_None = 0,
    HDMSectionTag_Free = 1,
    HDMSectionTag_Download,//下载队列中
    HDMSectionTag_Purchased,
    HDMSectionTag_Downloaded,
};

typedef NS_ENUM (NSUInteger, HDMWatchState)
{
    HDMWatchState_None = 0,//没看过
    HDMWatchState_Had,//之前看过
    HDMWatchState_Has,//刚看过
};

typedef enum {
    
    HDMTotalRank = 1,
    HDMMonthRank = 2,
    HDMWeekRank = 3,
}HDMRank;//排行

typedef enum {
    
    HDMRenQiOrder = 1,
    HDMPingLunOrder = 2,
}HDMOrderType;//顺序

typedef enum {
    HDMPackageMerchandise = 0,//套餐包订购
    HDMProductMerchandise = 1,//按本订购
}HDMMerchandise;//商品

typedef enum {
    comicOnlinePlay = 501,
    comicDownload = 502,
    videoOnlinePlay = 503,
    videoDownload = 504,
    themeDownload,
    qxsOnlinePlay,
    qxsDownload,
}HDMWatchType;

typedef enum {
    
    HDMComicPackageBag = 1,
    HDMComicMagazinePackageBag = 2,
    HDMBrandPackageBag = 3,
    HDMPlacePackageBag = 4,
}HDMPackageBag;
