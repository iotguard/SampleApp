//
//  GTVideoCoverView.h
//  SampleApp
//
//  Created by dianyi on 2019/8/23.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GTVideoCoverView : UICollectionViewCell
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;
@end

