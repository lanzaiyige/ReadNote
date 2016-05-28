//
//  RNTabBarController.m
//  ReadNote
//
//  Created by tanzk on 16/4/30.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "RNTabBarController.h"
#import "RNTableViewController.h"
#import "RNNoteMainViewController.h"

#define WEAK_SELF __weak typeof(self) weakSelf = self;

@interface RNTabBarController()
@property (strong, nonatomic) NSArray *tabTitles;
@property (strong, nonatomic) NSArray *tabImages;

@end

@implementation RNTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabTitles = @[@"笔记",@"书架",@"通知",@"我"];
    self.tabImages = @[@"tabbar-news", @"tabbar-tweet", @"tabbar-discover", @"tabbar-me"];
    
    RNNoteMainViewController *noteVC = [[RNNoteMainViewController alloc] init];
    noteVC.title = self.tabTitles[0];
    noteVC.tabBarItem.image = [[UIImage imageNamed:_tabImages[0]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    noteVC.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@-selected",_tabImages[0]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *noteNav = [[UINavigationController alloc] initWithRootViewController:noteVC];
    
    self.viewControllers = @[noteNav];
    
}

@end
