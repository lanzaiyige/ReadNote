//
//  RNTabBarController.m
//  ReadNote
//
//  Created by tanzk on 16/4/30.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "RNTabBarController.h"
#import "RNTableViewController.h"
#import <UIKit/UIKit.h>

#define WEAK_SELF __weak typeof(self) weakSelf = self;

@interface RNTabBarController()
@property (strong, nonatomic) NSArray *tabTitles;
@property (strong, nonatomic) NSArray *tabImages;

@end

@implementation RNTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    
    RNTableViewController *tableVC = [[RNTableViewController alloc] init];
    RNTableViewController *table1VC = [[RNTableViewController alloc] init];
    RNTableViewController *table2VC = [[RNTableViewController alloc] init];
    RNTableViewController *table3VC = [[RNTableViewController alloc] init];
    
    self.viewControllers = @[tableVC,table1VC,table2VC,table3VC];
    
    self.tabTitles = @[@"笔记",@"消息",@"通知",@"我"];
    self.tabImages = @[@"tabbar-news", @"tabbar-tweet", @"tabbar-discover", @"tabbar-me"];
    
    WEAK_SELF
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTitle:weakSelf.tabTitles[idx]];
        
        UIImage *normalImage = [UIImage imageNamed:weakSelf.tabImages[idx]];
        [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UIImage *selectImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@-selected",weakSelf.tabImages[idx]]];
        [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [obj setImage:normalImage];
        [obj setSelectedImage:selectImage];
    }];
}

@end
