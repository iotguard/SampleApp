//
//  GTListItem.h
//  SampleApp
//
//  Created by dianyi on 2019/8/22.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTListItem : NSObject <NSSecureCoding>

@property (nonatomic, copy, readwrite) NSString *category;
@property (nonatomic, copy, readwrite) NSString *picUrl;
@property (nonatomic, copy, readwrite) NSString *uniqueKey;
@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, copy, readwrite) NSString *date;
@property (nonatomic, copy, readwrite) NSString *authorName;
@property (nonatomic, copy, readwrite) NSString *articleUrl;

- (void)configWithDictionary:(NSDictionary *)dictionary;

@end

