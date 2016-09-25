//
//  RNModelData.m
//  ReadNote
//
//  Created by tanzk on 16/7/17.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "RNModelData.h"


@implementation RNModelData

- (instancetype)initWithClass:(Class)cls {
    return nil;
}

+ (instancetype)metaWithClass:(Class)cls {
    if(!cls) return nil;
    static CFMutableDictionaryRef cache;
    static dispatch_once_t onceToken;
    static dispatch_semaphore_t lock;
    
    dispatch_once(&onceToken, ^{
        cache = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        lock = dispatch_semaphore_create(1);
    });
    
    dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
    RNModelData *meta = CFDictionaryGetValue(cache, (__bridge const void *)cls);
    dispatch_semaphore_signal(lock);
    
    if(!meta || meta -> _classInfo.needUpdate) {
        meta = [[RNModelData alloc] init];
        dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
        CFDictionarySetValue(cache, (__bridge const void *)(cls), (__bridge const void *)(meta));
        dispatch_semaphore_signal(lock);
    }
    
    return meta;
}

@end
