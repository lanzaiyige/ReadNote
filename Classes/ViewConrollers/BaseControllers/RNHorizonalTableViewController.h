//
//  RNHorizonalTableViewController.h
//  ReadNote
//
//  Created by tanzk on 16/5/2.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RNHorizonalTableViewController : UITableViewController

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) NSMutableArray *controllers;

- (instancetype)initWithControllers:(NSArray *)controllers;

- (void)scrollToIndex:(NSUInteger)index;

@end
