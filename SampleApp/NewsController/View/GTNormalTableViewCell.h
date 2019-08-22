//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by caowentao on 2019/8/11.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTListItem;

@protocol GTNormalTableViewCellDelegate <NSObject>
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;
@end

@interface GTNormalTableViewCell : UITableViewCell
@property (nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;
- (void)layoutTableViewCellWithItem:(GTListItem *)item;
@end

