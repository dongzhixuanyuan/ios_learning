//
//  GTVideoViewCollectionViewCell.h
//  SampleApp
//
//  Created by liudong on 2020/4/5.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoViewCollectionViewCell : UICollectionViewCell
-(void) layoutwithVideoUrl:(NSString*)videoUrl coverUrl:(NSString*)coverUrl;
@end

NS_ASSUME_NONNULL_END
