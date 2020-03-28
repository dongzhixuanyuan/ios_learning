//
//  GTDeleteView.h
//  SampleApp
//
//  Created by liudong on 2020/3/28.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteView : UIView
-(void) showAtPoint:(CGPoint)point clickblock :(dispatch_block_t) clickCallback;
-(void) hide;
@end

NS_ASSUME_NONNULL_END
