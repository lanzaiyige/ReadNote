//
//  UIImageView+RNCornerRadius.m
//  ReadNote
//
//  Created by tanzk on 16/7/15.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "UIImageView+RNCornerRadius.h"

@implementation UIImageView (RNCornerRadius)

static void addRoundedRectToPath(CGContextRef context,CGRect rect, float ovalWidth, float ovalHeight) {
    float fw,fh;
    if(ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
}

+ (UIImage *)imageWithRoundImage:(UIImage *)image size:(CGSize)size radius:(CGFloat)radius {
    size = CGSizeMake(size.width * 2, size.height * 2);
    radius *= 2;
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(NULL, size.width, size.height, 8, 4 * size.width, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    CGContextBeginPath(ctx);
    
    
    return nil;
}

@end
