//
//  NewsTableViewCell.m
//  SampleApp
//
//  Created by liudong on 2020/3/17.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "NewsTableViewCell.h"

@interface NewsTableViewCell()
@property(readwrite,nonatomic,strong)UILabel* title;
@property(readwrite,nonatomic,strong)UILabel* source;
@property(readwrite,nonatomic,strong)UILabel* comment;
@property(readwrite,nonatomic,strong)UILabel* timestamp;
@property(readwrite,nonatomic,strong)UIImageView* rightImageView;
@property(readwrite,nonatomic,strong)UIButton* btn;

@end

@implementation NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:({
            self.title = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 500, 50)];
//            self.title.backgroundColor = [UIColor redColor];
            self.title.font = [UIFont systemFontOfSize:(12)];
            self.title.textColor = [UIColor grayColor];
            self.title;
        })];
         
        
         [self.contentView addSubview:({
            self.source = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, 50, 20)];
//            self.source.backgroundColor = [UIColor redColor];
             self.source.font = [UIFont systemFontOfSize:(12)];
           self.source.textColor = [UIColor grayColor];
            self.source;
         })];
        
        [self.contentView addSubview:({
            self.comment = [[UILabel alloc]initWithFrame:CGRectMake(70, 70, 50, 20)];
//            self.comment.backgroundColor = [UIColor redColor];
            self.comment.font = [UIFont systemFontOfSize:(12)];
            self.comment.textColor = [UIColor grayColor];
            self.comment;
        })];
        
        
        [self.contentView addSubview:({
            self.timestamp = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 50, 20)];
//            self.timestamp.backgroundColor = [UIColor redColor];
            self.timestamp.font = [UIFont systemFontOfSize:(12)];
            self.timestamp.textColor = [UIColor grayColor];
            self.timestamp;})];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(330, 15, 70, 70)];
            self.rightImageView.backgroundColor = [UIColor redColor];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];
        
        [self.contentView addSubview:({
            self.btn = [[UIButton alloc]initWithFrame:CGRectMake(290, 80, 30, 20)];
            [self.btn setTitle:@"X" forState:UIControlStateNormal];
            [self.btn setTitle:@"Y" forState:UIControlStateHighlighted];
            [self.btn addTarget:self action:@selector(rightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
            self.btn.backgroundColor = [UIColor blueColor];
            self.btn;
        })];
        
        
        
    }
    return self;
}

- (void) fillData{
    self.title.text = @"极客时间IOS开发";
    [self.title sizeToFit];
    self.source.text = @"极客时间";
    [self.source sizeToFit];
    self.comment.text = @"1888评论";
    [self.comment sizeToFit];
    self.comment.frame = CGRectMake(self.source.frame.origin.x +self.source.frame.size.width + 15 , self.comment.frame.origin.y, self.comment.frame.size.width, self.comment.frame.size.height);
    self.timestamp.text = @"三分钟前";
    [self.timestamp sizeToFit];
    self.timestamp.frame = CGRectMake(self.comment.frame.origin.x +self.comment.frame.size.width + 15 , self.timestamp.frame.origin.y, self.timestamp.frame.size.width, self.timestamp.frame.size.height);
    self.rightImageView.image = [UIImage imageNamed:@"icon"];
}

-(void)rightBtnClicked{
    NSLog(@"rightBtnClicked");
}

@end
