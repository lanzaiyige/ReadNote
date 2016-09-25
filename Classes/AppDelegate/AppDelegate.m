//
//  AppDelegate.m
//  ReadNote
//
//  Created by tanzk on 16/4/30.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "AppDelegate.h"
#import "RNRootViewConroller.h"
#import "RNTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)testLog {
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5 - i; j++) {
            printf("#");
        }
        printf("\n");
    }
}

- (void)testLog1 {
    for (int i = 1; i < 8; i++) {
        NSInteger number = 4 - abs(i - 4);
        for (int j = 0; j < number; j++) {
            printf("#");
        }
        printf("\n");
    }
}

- (void)testLog2 {
    for (int i = 0; i < 5; i++) {
        for (int k = 0; k < i; k++) {
            printf(" ");
        }
        
        NSInteger number = 8 - i;
        for (int j = i; j < number; j++) {
            printf("#");
        }
        
        printf("\n");
    }
}

static char convert(int number) {
    int a[100];
    int i = 0;
    int m = 0;
    
    int yushu;
    
    char hex[16] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
    while (number > 0) {
        yushu = number % 16;
        a[i++] = yushu;
        number = number / 16;
    }
    
    for (int k = i - 1; k >= 0; k--) {
        m = a[k];
        printf("%c",hex[m]);
    }
    
    return 0;
}

- (void)testSemaphore {
    dispatch_group_t groupQueue = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (int i = 0; i < 100; i++) {
        long wait = dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"wait:%ld",wait);
        dispatch_group_async(groupQueue, queue, ^{
            NSLog(@"%i",i);
            sleep(2);
            
            long signal = dispatch_semaphore_signal(semaphore);
            NSLog(@"signal:%ld",signal);
        });
    }
    
    long groupWait = dispatch_group_wait(groupQueue, DISPATCH_TIME_FOREVER);
    NSLog(@"groupSignal:%ld",groupWait);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    RNRootViewConroller *testVC = [[RNRootViewConroller alloc] init];
    
    [self.window setRootViewController:testVC];
    
    [self.window makeKeyAndVisible];
    
    [self testSemaphore];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
