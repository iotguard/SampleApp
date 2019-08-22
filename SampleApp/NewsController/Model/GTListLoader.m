//
//  GTListLoader.m
//  SampleApp
//
//  Created by dianyi on 2019/8/21.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListItem.h"

@implementation GTListLoader

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock
{
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        NSArray *dataArray = [(NSDictionary *)[(NSDictionary *)jsonObj objectForKey:@"result"] objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
        
    }];
    [dataTask resume];
    
//    [[AFHTTPSessionManager manager] GET:@"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e"
//         parameters:nil progress:^(NSProgress *downloadProgress) {
//
//         } success:^(NSURLSessionDataTask *task, id responseObject) {
//             <#code#>
//         } failure:^(NSURLSessionDataTask *task, NSError *error) {
//             <#code#>
//         }];
}

@end
