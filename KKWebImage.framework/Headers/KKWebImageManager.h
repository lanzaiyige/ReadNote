//
//  KKWebImageManager.h
//  KKWebImage
//
//  Created by tanzk on 16/7/30.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKWebImageCompat.h"
#import "KKImageCache.h"
#import "UIImage+ForceDecode.h"

@class KKWebImageManager;

@protocol KKWebImageManagerDelegate <NSObject>

@optional
- (BOOL)imageManager:(KKWebImageManager *)imageManager shouldDownloadImageForURL:(NSURL *)imageURL;

@end

@interface KKWebImageManager : NSOperation

@property (strong, nonatomic, readonly) KKImageCache *imageCache;

+ (KKWebImageManager *)shareManager;

@end
