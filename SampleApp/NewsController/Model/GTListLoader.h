//
//  GTListLoader.h
//  SampleApp
//
//  Created by dianyi on 2019/8/21.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GTListItem;

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);
/**
 请求列表
 */
@interface GTListLoader : NSObject

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;

@end
