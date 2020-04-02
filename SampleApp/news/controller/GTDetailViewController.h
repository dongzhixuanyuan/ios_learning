//
//  GTDetailViewController.h
//  SampleApp
//
//  Created by liudong on 2020/3/25.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDetailViewController<WKNavigationDelegate> : UIViewController

-(instancetype) initWithUrl:(NSURL*) url;

@end

NS_ASSUME_NONNULL_END
