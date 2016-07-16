//
//  RNTableViewController.m
//  ReadNote
//
//  Created by tanzk on 16/4/30.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "RNTableViewController.h"
#import "RNTableViewCell.h"

static NSString *const cellIdentifier = @"cellIdentifier";

@interface RNTableViewController ()

@end

@implementation RNTableViewController

- (id)init {
    self = [super init];
    if(self) {
        _objects = [NSArray new];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[RNTableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  _objects.count;
}

@end
