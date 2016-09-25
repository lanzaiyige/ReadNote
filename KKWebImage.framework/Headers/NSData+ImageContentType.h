//
//  NSData+ImageContentType.h
//  KKWebImage
//
//  Created by tanzk on 16/7/24.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ImageContentType)

+ (NSString *)kk_contentTypeForImageData:(NSData *)data;

@end
