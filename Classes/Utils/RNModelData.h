//
//  RNModelData.h
//  ReadNote
//
//  Created by tanzk on 16/7/17.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RNClassInfo.h"

@interface RNModelData : NSObject {
    @package
    RNClassInfo *_classInfo;
    NSDictionary *_mapper;
    NSArray *_allPropertyMetas;
    NSArray *_keyPathPropertyMetas;
    NSArray *_multiKeysPropertyMetas;
    NSUInteger _keyMappedCount;
    
}

+ (instancetype)metaWithClass:(Class)cls;

@end
