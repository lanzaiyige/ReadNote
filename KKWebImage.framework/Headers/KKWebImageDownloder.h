//
//  KKWebImageDownloder.h
//  KKWebImage
//
//  Created by tanzk on 2016/9/16.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKWebImageCompat.h"
#import "KKWebImageOperation.h"

typedef NS_OPTIONS(NSUInteger, KKWebImageDownloadOptions) {
    KKWebImageDownloaderLowPriority = 1 << 0,
    KKWebImageDownloaderProgressiveDownload = 1 << 1,
    
    /**
     * By default, request prevent the use of NSURLCache. With this flag, NSURLCache
     * is used with default policies.
     */
    KKWebImageDownloaderUseNSURLCache = 1 << 2,
    
    /**
     * Call completion block with nil image/imageData if the image was read from NSURLCache
     * (to be combined with `SDWebImageDownloaderUseNSURLCache`).
     */
    
    KKWebImageDownloaderIgnoreCachedResponse = 1 << 3,
    /**
     * In iOS 4+, continue the download of the image if the app goes to background. This is achieved by asking the system for
     * extra time in background to let the request finish. If the background task expires the operation will be cancelled.
     */
    
    KKWebImageDownloaderContinueInBackground = 1 << 4,
    
    /**
     * Handles cookies stored in NSHTTPCookieStore by setting
     * NSMutableURLRequest.HTTPShouldHandleCookies = YES;
     */
    KKWebImageDownloaderHandleCookies = 1 << 5,
    
    /**
     * Enable to allow untrusted SSL certificates.
     * Useful for testing purposes. Use with caution in production.
     */
    KKWebImageDownloaderAllowInvalidSSLCertificates = 1 << 6,
    
    /**
     * Put the image in the high priority queue.
     */
    KKWebImageDownloaderHighPriority = 1 << 7,
};

typedef NS_ENUM(NSInteger, KKWebImageDownloaderExecutionOrder) {
    /**
     * Default value. All download operations will execute in queue style (first-in-first-out).
     */
    KKWebImageDownloaderFIFOExecutionOrder,
    
    /**
     * All download operations will execute in stack style (last-in-first-out).
     */
    KKWebImageDownloaderLIFOExecutionOrder
};

typedef NSDictionary *(^KKWebImageDownloaderHeaderFilterBlock)(NSURL *url, NSDictionary *headers);

typedef void (^KKWebImageDownloaderCompletedBlock)(UIImage *image, NSData *data, NSError *error, BOOL isfinished);

typedef void (^KKWebImageDownloaderProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);

@interface KKWebImageDownloder : NSObject

@property (assign, nonatomic) BOOL shouldDecompressImages;

@property (assign, nonatomic) NSInteger maxConcurrentDownloads;

@property (readonly, nonatomic) NSUInteger currentDownloadCount;

@property (assign, nonatomic) NSTimeInterval downloadTimeout;

@property (assign, nonatomic) KKWebImageDownloaderExecutionOrder executionOrder;

@property (strong, nonatomic) NSURLCredential *urlCredential;

@property (strong, nonatomic) NSString *userName;

@property (strong, nonatomic) NSString *password;

@property (copy, nonatomic) KKWebImageDownloaderHeaderFilterBlock headerFilter;

+ (KKWebImageDownloder *)shareDownloader;

- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;

- (NSString *)valueforHTTPHeaderField:(NSString *)field;

- (void)setOperationClass:(Class)operationClass;

- (id <KKWebImageOperation>)downloadImageWithUrl:(NSURL *)url
                                         options:(KKWebImageDownloadOptions)options
                                        progress:(KKWebImageDownloaderProgressBlock)progressBlock
                                       completed:(KKWebImageDownloaderCompletedBlock)completedBlock;

- (void)setSuspend:(BOOL)suspended;

- (void)cancelAllDownloads;
@end
