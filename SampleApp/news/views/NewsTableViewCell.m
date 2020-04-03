//
//  NewsTableViewCell.m
//  SampleApp
//
//  Created by liudong on 2020/3/17.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "GTDeleteView.h"

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
            self.title = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 250, 50)];

            self.title.font = [UIFont systemFontOfSize:(16)];
            self.title.textColor = [UIColor blackColor];
            self.title.numberOfLines =2 ;
            self.title.lineBreakMode = NSLineBreakByTruncatingTail;
            self.title;
        })];
         
        
         [self.contentView addSubview:({
            self.source = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, 50, 20)];
             self.source.font = [UIFont systemFontOfSize:(12)];
           self.source.textColor = [UIColor grayColor];
            self.source;
         })];
        
        [self.contentView addSubview:({
            self.comment = [[UILabel alloc]initWithFrame:CGRectMake(70, 70, 50, 20)];

            self.comment.font = [UIFont systemFontOfSize:(12)];
            self.comment.textColor = [UIColor grayColor];
            self.comment;
        })];
        
        
        [self.contentView addSubview:({
            self.timestamp = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 50, 20)];

            self.timestamp.font = [UIFont systemFontOfSize:(12)];
            self.timestamp.textColor = [UIColor grayColor];
            self.timestamp;})];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(330, 15, 70, 70)];
        
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];
        
//        [self.contentView addSubview:({
//            self.btn = [[UIButton alloc]initWithFrame:CGRectMake(290, 80, 30, 20)];
//            [self.btn setTitle:@"X" forState:UIControlStateNormal];
//            [self.btn setTitle:@"Y" forState:UIControlStateHighlighted];
//            [self.btn addTarget:self action:@selector(rightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
//            self.btn.backgroundColor = [UIColor blueColor];
//            self.btn.layer.cornerRadius = 10;
//            self.btn.layer.masksToBounds = YES;
//            self.btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
//            self.btn.layer.borderWidth = 2 ;
//            self.btn;
//        })];
        
        
        
    }
    return self;
}

- (void) fillData:(GTListItemModel*) model{
    self.title.text = model.title;
    [self.title sizeToFit];
    self.source.text = model.author_name;
    [self.source sizeToFit];
    self.comment.text = model.author_name;
    [self.comment sizeToFit];
    self.comment.frame = CGRectMake(self.source.frame.origin.x +self.source.frame.size.width + 15 , self.comment.frame.origin.y, self.comment.frame.size.width, self.comment.frame.size.height);
    self.timestamp.text = model.date;
    [self.timestamp sizeToFit];
    self.timestamp.frame = CGRectMake(self.comment.frame.origin.x +self.comment.frame.size.width + 15 , self.timestamp.frame.origin.y, self.timestamp.frame.size.width, self.timestamp.frame.size.height);
    UIImage* imageData = [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString:model.thumbnail_pic_s] ] ];
    self.rightImageView.image = imageData;
}

-(void)rightBtnClicked{
    //    NSLog(@"rightBtnClicked");
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:deleteBtnClick:)]){
        [self.delegate tableViewCell:self deleteBtnClick:_btn];
    }
}

@end