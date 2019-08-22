//
//  GTListItem.m
//  SampleApp
//
//  Created by dianyi on 2019/8/22.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import "GTListItem.h"

@implementation GTListItem

- (void)configWithDictionary:(NSDictionary *)dictionary
{
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}

@end
