//
//  KKWebImageCompat.h
//  KKWebImage
//
//  Created by tanzk on 16/7/19.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern UIImage *KKScaleImageForKey(NSString *key, UIImage *image);

typedef void (^KKWebImageNoParamsBlock)();

extern NSString * const KKWebImageErrorDomain;

#define dispatch_main_sync_safe(block)\
    if([NSThread isMain])