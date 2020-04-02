//
//  GTListLoader.h
//  SampleApp
//
//  Created by liudong on 2020/3/29.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GTListItemModel;
typedef void (^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItemModel *> *array);
NS_ASSUME_NONNULL_BEGIN

@interface GTListLoader : NSObject
- (void)loadListData:(GTListLoaderFinishBlock)block;
@end

NS_ASSUME_NONNULL_END
