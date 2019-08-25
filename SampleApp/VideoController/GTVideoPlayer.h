//
//  GTVideoPlayer.h
//  SampleApp
//
//  Created by caowentao on 2019/8/25.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GTVideoPlayer : NSObject
+ (GTVideoPlayer *)Player;
- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView;
@end
