//
//  RNHorizonalTableViewController.m
//  ReadNote
//
//  Created by tanzk on 16/5/2.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "RNHorizonalTableViewController.h"

static NSString *cellIdentifier = @"HorizonalCell";

@implementation RNHorizonalTableViewController

- (instancetype)initWithControllers:(NSArray *)controllers{
    self = [super init];
    if(self){
        _controllers = [NSMutableArray arrayWithArray:controllers];
        for(UIViewController *vc in controllers){
            [self addChildViewController:vc];
        }
    }
    return self;
}

- (void)scrollToIndex:(NSUInteger)index{
    
}

#pragma mark - View Life cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.tableView = [UITableView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.bounces = NO;
    self.tableView.pagingEnabled = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _controllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.tableView.frame.size.width;
}


@end
