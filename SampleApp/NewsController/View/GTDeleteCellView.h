//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by dianyi on 2019/8/19.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GTDeleteCellView : UIView
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
@end

