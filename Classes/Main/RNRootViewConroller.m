//
//  RNRootViewConroller.m
//  ReadNote
//
//  Created by tanzk on 16/4/30.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "RNRootViewConroller.h"
#import "RNTabBarController.h"

@interface TestSingle : NSObject

+ (TestSingle *)shareInstance;

@end

@implementation TestSingle

+ (TestSingle *)shareInstance {
    static TestSingle *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[TestSingle alloc] init];
    });
    return instance;
}

- (id)init {
    return [self initWithTest];
}

- (id)initWithTest {
    if(self = [super init]) {
        
    }
    return self;
}

@end

@implementation RNRootViewConroller

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];

    TestSingle *test = [TestSingle shareInstance];
    
    RNTabBarController *tabBarController = [[RNTabBarController alloc] init];
    [self addChildViewController:tabBarController];
    [self.view addSubview:tabBarController.view];
    [tabBarController didMoveToParentViewController:self];
}

@end
