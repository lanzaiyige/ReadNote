//
//  KKWebImageDownloderOperation.h
//  KKWebImage
//
//  Created by tanzk on 2016/9/16.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKWebImageOperation.h"
#import "KKWebImageDownloder.h"

extern NSString *const KKWebImageDownloadStartNotification;
extern NSString *const KKWebImageDownloadReceiveResponseNotification;
extern NSString *const KKWebImageDownloadStopNotification;
extern NSString *const KKWebImageDownloadFinishNotificaion;

@interface KKWebImageDownloderOperation : NSOperation<
KKWebImageOperation,
NSURLSessionTaskDelegate,
NSURLSessionDataDelegate>

@property (strong, nonatomic, readonly) NSURLRequest *request;

@property (strong, nonatomic, readonly) NSURLSessionTask *dataTask;

@property (assign, nonatomic) BOOL shouldDecompressImages;

@property (assign, nonatomic) NSURLCredential *credential;

@property (assign, nonatomic) NSInteger expectedSize;

@property (strong, nonatomic) NSURLResponse *response;

@property (assign, nonatomic, readonly) KKWebImageDownloadOptions options;

- (id)initWithRequest:(NSURLRequest *)request
            inSession:(NSURLSession *)session
              options:(KKWebImageDownloadOptions)options
            completed:(KKWebImageDownloaderCompletedBlock)completedBlock
             progress:(KKWebImageDownloaderProgressBlock)progressBlock
             canceled:(KKWebImageNoParamsBlock)canceledBlock;

@end
