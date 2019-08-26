//
//  GTMediator.m
//  SampleApp
//
//  Created by dianyi on 2019/8/26.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import "GTMediator.h"

@implementation GTMediator
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl
{
    Class detailCls = NSClassFromString(@"GTDetailViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:detailUrl];
    return controller;
}

+ (NSMutableDictionary *)mediatorCache
{
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}
+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock
{
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params
{
    GTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

+ (void)registerProtocol:(Protocol *)proto class:(Class)cls
{
    if (proto && cls) {
        [[[self class] mediatorCache] setObject:cls forKey:NSStringFromProtocol(proto)];
    }
}
+ (Class)classForProtocol:(Protocol *)proto
{
    return [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(proto)];
}
@end
