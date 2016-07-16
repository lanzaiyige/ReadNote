//
//  UIImageView+RNCornerRadius.h
//  ReadNote
//
//  Created by tanzk on 16/7/15.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (RNCornerRadius)

+ (UIImage *)imageWithRoundImage:(UIImage *)image size:(CGSize)size radius:(CGFloat)radius;

@end
