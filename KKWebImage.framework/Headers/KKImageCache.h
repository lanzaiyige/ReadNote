//
//  KKImageCache.h
//  KKWebImage
//
//  Created by tanzk on 16/7/20.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KKImageCacheType) {
    KKImageCacheTypeNone,
    KKImageCacheTypeDisk,
    KKImageCacheTypeMemory
};

typedef void (^KKWebImageQueryCompletionBlock)(UIImage *image,KKImageCacheType type);

typedef void (^KKWebImageCheckCacheCompletionBlock)(BOOL isInCache);

typedef void (^KKWebImageCalculateSizeBlock)(NSUInteger size,NSUInteger count);

@interface KKImageCache : NSObject

// 缓存最长保存期限
@property (assign, nonatomic) NSInteger maxCacheAge;

@property (assign, nonatomic) NSUInteger maxCacheSize;

@property (assign, nonatomic) NSUInteger maxMemoryCost;

@property (assign, nonatomic) NSUInteger maxMemoryCountLimit;

@property (assign, nonatomic) BOOL shouldCacheImagesInMemory;

@property (assign, nonatomic) BOOL shouldDecompressImages;

+ (KKImageCache *)shareInstance;

- (NSUInteger)getSize;

- (NSUInteger)getDiskCount;

- (void)calculateDiskCacheSizeAndCount:(KKWebImageCalculateSizeBlock)completionBlock;

@end
