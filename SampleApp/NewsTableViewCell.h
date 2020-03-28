//
//  NewsTableViewCell.h
//  SampleApp
//
//  Created by liudong on 2020/3/17.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NewsTableViewCellDelegate <NSObject>

-(void)tableViewCell:(UITableViewCell*)tableViewcell deleteBtnClick:(UIButton*)deleteBtn;
@end



@interface NewsTableViewCell : UITableViewCell
@property (weak,nonatomic,readwrite) id<NewsTableViewCellDelegate> delegate;
- (void) fillData;
@end

NS_ASSUME_NONNULL_END
