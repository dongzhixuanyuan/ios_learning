//
//  GTVideoViewCollectionViewCell.m
//  SampleApp
//
//  Created by liudong on 2020/4/5.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "GTVideoViewCollectionViewCell.h"



@interface GTVideoViewCollectionViewCell()
@property(nonatomic,strong,readwrite)UIImageView* coverView;
@property(nonatomic,strong,readwrite)UIImageView* playBtn;
@property(nonatomic,copy,readwrite)NSString* videoUrl;
@property(nonatomic,strong,readwrite)AVPlayerItem* item;
@property(nonatomic,strong,readwrite)AVPlayer* player;
@property(nonatomic,strong,readwrite)AVPlayerLayer* videolayer;

@end

@implementation GTVideoViewCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _coverView;
        })];
        [_coverView addSubview:({
            _playBtn = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-50)/2, (frame.size.height-50)/2, 50, 50)];
            _playBtn;
        })];
        [self addGestureRecognizer: [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_tapPlayBtn)] ];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handVideoComplete) name:AVPlayerItemDidPlayToEndTimeNotification object:  nil];
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)layoutwithVideoUrl:(NSString *)videoUrl coverUrl:(NSString *)coverUrl{
    _videoUrl = videoUrl;
    _coverView.image = [UIImage imageNamed:coverUrl];
    _playBtn.image = [UIImage imageNamed:@"videoPlay"];
}


-(void)_tapPlayBtn {
    
    AVAsset* asset = [AVAsset assetWithURL:[ NSURL URLWithString: _videoUrl]];
    _item = [AVPlayerItem playerItemWithAsset:asset];
    CMTime resDuration = _item.duration;
    NSLog(@"video 时长:%f",CMTimeGetSeconds(resDuration));
    [_item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_item addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    _player = [AVPlayer playerWithPlayerItem:_item];
    [_player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"当前的播放进度:%f",CMTimeGetSeconds(time));
    }];
    _videolayer= [AVPlayerLayer playerLayerWithPlayer:_player];
    _videolayer.frame = _coverView.frame;
    [_coverView.layer addSublayer:_videolayer];
//    [_player play];
    
}

-(void)_handVideoComplete {
    NSLog(@"");
    [_player seekToTime:CMTimeMake(0, 1)];
    [_player play];
//    [_videolayer removeFromSuperlayer];
//    _item = nil;
//    _player = nil;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if([keyPath isEqualToString: @"status"]){
        if(((NSNumber*)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay){
              NSLog(@"readyToPlay");
            [_player play];
        }
      
    }else if([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSLog(@"缓冲: %@",[change objectForKey:NSKeyValueChangeNewKey]);
    }
}


@end
