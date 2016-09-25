//
//  NSObject+RNModel.h
//  ReadNote
//
//  Created by tanzk on 16/7/17.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RNModel)

NS_ASSUME_NONNULL_BEGIN

+ (instancetype)modelWithJson:(id)json;

NS_ASSUME_NONNULL_END

@end
