//
//  NSObject+RNModel.m
//  ReadNote
//
//  Created by tanzk on 16/7/17.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "NSObject+RNModel.h"
#import "RNModelData.h"

@implementation NSObject (RNModel)

+ (instancetype)modelWithJson:(id)json {
    NSDictionary *dict = [self _dictionaryWithJson:json];
    return [self modelWithDictionary:dict];
}

+ (NSDictionary *)_dictionaryWithJson:(id)json {
    if(!json || json == (id)kCFNull) return nil;
    
    NSDictionary *resultDict = nil;
    NSData *jsonData = nil;
    if([json isKindOfClass:[NSDictionary class]]) {
        resultDict = json;
    } else if([json isKindOfClass:[NSString class]]) {
        jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    } else if([json isKindOfClass:[NSData class]]) {
        jsonData = json;
    }
    
    if(jsonData) {
        resultDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        if(![resultDict isKindOfClass:[NSDictionary class]]) {
            resultDict = nil;
        }
    }
    return resultDict;
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dict {
    if(!dict || dict == (id)kCFNull) return nil;
    if(![dict isKindOfClass:[NSDictionary class]]) return nil;
    
    Class cls = [self class];
    RNModelData *modelMeta = [RNModelData metaWithClass:cls];
    
    return nil;
}

@end
