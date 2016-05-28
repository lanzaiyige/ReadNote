//
//  RNTableViewController.m
//  ReadNote
//
//  Created by tanzk on 16/4/30.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "RNTableViewController.h"

@implementation RNTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    int randomR = arc4random_uniform(255);
    int randomG = arc4random_uniform(255);
    int randomB = arc4random_uniform(255);
    self.view.backgroundColor = [UIColor colorWithRed:randomR/255.0 green:randomG/255.0 blue:randomB/255.0 alpha:1];
}

@end
