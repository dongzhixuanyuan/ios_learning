//
//  GTPlayer.h
//  SampleApp
//
//  Created by liudong on 2020/4/8.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface GTPlayer : NSObject
+(GTPlayer*) playerIntance;
-(void) playWithUrl:(NSString*) videoUrl attachView:(UIView*)attachView;
@end

NS_ASSUME_NONNULL_END
