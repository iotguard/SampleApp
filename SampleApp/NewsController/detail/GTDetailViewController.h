//
//  GTDetailViewController.h
//  SampleApp
//
//  Created by dianyi on 2019/8/16.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMediator.h"

@interface GTDetailViewController : UIViewController<GTDetailViewControllerProtocol>

- (instancetype)initWithUrlString:(NSString *)urlString;

@end

