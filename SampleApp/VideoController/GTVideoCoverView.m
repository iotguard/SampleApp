//
//  GTVideoCoverView.m
//  SampleApp
//
//  Created by dianyi on 2019/8/23.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import "GTVideoCoverView.h"
#import "GTVideoPlayer.h"

@interface GTVideoCoverView()
@property(nonatomic, strong, readwrite) UIImageView *coverView;
@property(nonatomic, strong, readwrite) UIImageView *playButton;
@property(nonatomic, copy, readwrite) NSString *videoUrl;
@end

@implementation GTVideoCoverView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _coverView;
        })];
        
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-50)/2, (frame.size.height-50)/2, 50, 50)];
            _playButton.image = [UIImage imageNamed:@"icon.bundle/icon.png"];
            _playButton;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl
{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
}

- (void)_tapToPlay
{
    [[GTVideoPlayer Player] playVideoWithUrl:_videoUrl attachView:_coverView];
}

@end
