//
//  NewsTableViewCell.h
//  SampleApp
//
//  Created by liudong on 2020/3/17.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTListItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol NewsTableViewCellDelegate <NSObject>

-(void)tableViewCell:(UITableViewCell*)tableViewcell deleteBtnClick:(UIButton*)deleteBtn;
@end

@interface NewsTableViewCell : UITableViewCell
FOUNDATION_EXPORT NSString* const KEY_FOR_READ_ITEMS = @"KEY_FOR_READ_ITEMS";

+(void) addReadedItem:(NSString*) key;

+(void) flushReadedItems;

@property (weak,nonatomic,readwrite) id<NewsTableViewCellDelegate> delegate;

- (void) fillData:(GTListItemModel*)model;


@end

NS_ASSUME_NONNULL_END
