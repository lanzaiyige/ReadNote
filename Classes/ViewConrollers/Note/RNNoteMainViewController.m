//
//  RNNoteMainViewController.m
//  ReadNote
//
//  Created by tanzk on 16/5/28.
//  Copyright © 2016年 tanzk. All rights reserved.
//

#import "RNNoteMainViewController.h"

@interface RNNoteMainViewController ()

@end

@implementation RNNoteMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSessionConfiguration *sessionConfig = [[NSURLSessionConfiguration alloc] init];
    
    
    NSURL *url = [NSURL URLWithString:@"https://www.example.com/test.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSURL *newFile = [[NSURL URLWithString:documentPath] URLByAppendingPathComponent:[response.URL lastPathComponent]];
        
        [[NSFileManager defaultManager] copyItemAtURL:location toURL:newFile error:NULL];
    }];
    
    [task resume];
}

@end
