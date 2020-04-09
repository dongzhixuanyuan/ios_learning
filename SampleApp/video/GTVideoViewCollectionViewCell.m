//
//  GTVideoViewCollectionViewCell.m
//  SampleApp
//
//  Created by liudong on 2020/4/5.
//  Copyright © 2020 liudong. All rights reserved.
//


#import "GTVideoViewCollectionViewCell.h"
#import "GTPlayer.h"
#import "GTVideoToolbar.h"
@interface GTVideoViewCollectionViewCell()
@property(nonatomic,strong,readwrite)UIImageView* coverView;
@property(nonatomic,strong,readwrite)UIImageView* playBtn;
@property(nonatomic,copy,readwrite)NSString* videoUrl;


@end

@implementation GTVideoViewCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 50)];
            _coverView;
        })];
        [_coverView addSubview:({
            _playBtn = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-50)/2, (_coverView. frame.size.height-50)/2, 50, 50)];
            _playBtn;
        })];
        [self addSubview:({
            GTVideoToolbar* toolBar = [[GTVideoToolbar alloc]initWithFrame:CGRectMake(0, _coverView.frame.size.height, self.frame.size.width, 50)];
            [toolBar fillData:nil];
            toolBar;
        })];
        [self addGestureRecognizer: [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_tapPlayBtn)] ];
    }
    
    return self;
}

- (void)layoutwithVideoUrl:(NSString *)videoUrl coverUrl:(NSString *)coverUrl {
    _videoUrl = videoUrl;
    _coverView.image = [UIImage imageNamed:coverUrl];
    _playBtn.image = [UIImage imageNamed:@"videoPlay"];
}


-(void)_tapPlayBtn {
    [[GTPlayer playerIntance]playWithUrl:_videoUrl attachView:_coverView];
}

@end
