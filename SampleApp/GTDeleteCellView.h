//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by dianyi on 2019/8/19.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
@end

NS_ASSUME_NONNULL_END
