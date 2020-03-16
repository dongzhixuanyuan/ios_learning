//
//  GTVideoController.h
//  SampleApp
//
//  Created by liudong on 2020/3/16.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface GTVideoController :UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
+(instancetype) initWithParams:(NSString*)title unselectedImage:(UIImage*) unselectedImage selectedImage:(UIImage*) selectedImage;
@end

NS_ASSUME_NONNULL_END
