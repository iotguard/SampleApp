//
//  GTMediator.h
//  SampleApp
//
//  Created by dianyi on 2019/8/26.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol GTDetailViewControllerProtocol <NSObject>
- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;
@end

@interface GTMediator : NSObject
//target action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

//urlscheme
typedef void(^GTMediatorProcessBlock)(NSDictionary *params);
+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

//protocol class
+ (void)registerProtocol:(Protocol *)proto class:(Class)cls;
+ (Class)classForProtocol:(Protocol *)proto;
@end

