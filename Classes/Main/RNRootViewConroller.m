//
//  RNRootViewConroller.m
//  ReadNote
//
//  Created by tanzk on 16/4/30.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "RNRootViewConroller.h"
#import "RNTabBarController.h"

@implementation RNRootViewConroller

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];

    RNTabBarController *tabBarController = [[RNTabBarController alloc] init];
    [self addChildViewController:tabBarController];
    [self.view addSubview:tabBarController.view];
    [tabBarController didMoveToParentViewController:self];
}

@end
