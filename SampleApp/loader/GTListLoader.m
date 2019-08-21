//
//  GTListLoader.m
//  SampleApp
//
//  Created by dianyi on 2019/8/21.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import "GTListLoader.h"

@implementation GTListLoader

- (void)loadListData
{
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];
    
    //NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"");
    }];
    
    [dataTask resume];
    
    NSLog(@"");
}

@end
