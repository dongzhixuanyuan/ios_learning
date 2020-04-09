//
//  GTVideoToolbar.m
//  SampleApp
//
//  Created by liudong on 2020/4/8.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTVideoToolbar.h"

@interface GTVideoToolbar()

@property(nonatomic,strong,readwrite)UIImageView* authorImage;
@property(nonatomic,strong,readwrite)UILabel* authorText;

@property(nonatomic,strong,readwrite)UIImageView* commentImage;
@property(nonatomic,strong,readwrite)UILabel* commentText;

@property(nonatomic,strong,readwrite)UIImageView* praiseImage;
@property(nonatomic,strong,readwrite)UILabel* praiseText;

@property(nonatomic,strong,readwrite)UIImageView* shareImage;
@property(nonatomic,strong,readwrite)UILabel* shareText;

@end


@implementation GTVideoToolbar

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor redColor];
    [self addSubview:({
        _authorImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _authorImage.layer.masksToBounds = YES;
        _authorImage.layer.cornerRadius = 15;
        _authorImage.translatesAutoresizingMaskIntoConstraints = NO;
        _authorImage;
    })];
    [self addSubview:({
        _authorText = [[UILabel alloc]init];
        _authorText.font = [UIFont systemFontOfSize:15];
        _authorText.textColor = [UIColor lightGrayColor];
        _authorText.translatesAutoresizingMaskIntoConstraints = NO;
        _authorText;
    })];
    
    [self addSubview:({
        _commentImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _commentImage.layer.masksToBounds = YES;
        _commentImage.layer.cornerRadius = 15;
        _commentImage.translatesAutoresizingMaskIntoConstraints = NO;
        _commentImage;
    })];
    [self addSubview:({
        _commentText = [[UILabel alloc]init];
        _commentText.font = [UIFont systemFontOfSize:15];
        _commentText.textColor = [UIColor lightGrayColor];
        _commentText.translatesAutoresizingMaskIntoConstraints = NO;
        _commentText;
    })];
    [self addSubview:({
        _praiseImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _praiseImage.layer.masksToBounds = YES;
        _praiseImage.layer.cornerRadius = 15;
        _praiseImage.translatesAutoresizingMaskIntoConstraints = NO;
        _praiseImage;
    })];
    [self addSubview:({
        _praiseText = [[UILabel alloc]init];
        _praiseText.font = [UIFont systemFontOfSize:15];
        _praiseText.textColor = [UIColor lightGrayColor];
        _praiseText.translatesAutoresizingMaskIntoConstraints = NO;
        _praiseText;
    })];
    [self addSubview:({
        _shareImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _shareImage.layer.masksToBounds = YES;
        _shareImage.layer.cornerRadius = 15;
        _shareImage.translatesAutoresizingMaskIntoConstraints = NO;
        _shareImage;
    })];
    [self addSubview:({
        _shareText = [[UILabel alloc]init];
        _shareText.font = [UIFont systemFontOfSize:15];
        _shareText.textColor = [UIColor lightGrayColor];
        _shareText.translatesAutoresizingMaskIntoConstraints = NO;
        _shareText;
    })];
    
    return self;
}

-(void)fillData:(id)model {
    _authorImage.image = [UIImage imageNamed:@"icon"];
    [_authorImage.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:20  ].active = true;
    [_authorImage.widthAnchor constraintEqualToConstant:50].active = true;
    [_authorImage.heightAnchor constraintEqualToConstant:50].active = true;
    [_authorImage.topAnchor constraintEqualToAnchor:self.topAnchor constant:0].active = true;
    [_authorImage.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0].active = true;
    _authorText.text = @"极客时间";
    [_authorText.leadingAnchor constraintEqualToAnchor:_authorImage.trailingAnchor constant:20].active = true;
    [_authorText.topAnchor constraintEqualToAnchor:self.topAnchor].active = true;
    [_authorText.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = true;
    
    [_shareText.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-40].active = true;
    [_shareText.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = true;
    
    _shareText.text = @"分享";
    
    [_shareImage.centerYAnchor constraintEqualToAnchor:_shareText.centerYAnchor].active = true;
    _shareImage.image = [UIImage imageNamed:@"share"];
    [_shareImage.trailingAnchor constraintEqualToAnchor:_shareText.leadingAnchor constant:-20].active = true;
    
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc]init];
    [_shareImage addGestureRecognizer:gesture];
    
    
    
}

@end
