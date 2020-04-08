//
//  GTPlayer.m
//  SampleApp
//
//  Created by liudong on 2020/4/8.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "GTPlayer.h"

@interface GTPlayer()
@property(nonatomic,strong,readwrite)AVPlayerItem* item;
@property(nonatomic,strong,readwrite)AVPlayer* player;
@property(nonatomic,strong,readwrite)AVPlayerLayer* videolayer;

@end


@implementation GTPlayer

+(GTPlayer*) playerIntance {
    static GTPlayer* player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[GTPlayer alloc]init];
    });
    return player;
}

- (void)playWithUrl:(NSString *)videoUrl attachView:(UIView *)attachV {
    [[GTPlayer playerIntance]stopPlay];
    
    AVAsset* asset = [AVAsset assetWithURL:[ NSURL URLWithString: videoUrl]];
    _item = [AVPlayerItem playerItemWithAsset:asset];
    CMTime resDuration = _item.duration;
    NSLog(@"video 时长:%f",CMTimeGetSeconds(resDuration));
    [_item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [_item addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    _player = [AVPlayer playerWithPlayerItem:_item];
    [_player addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"当前的播放进度:%f",CMTimeGetSeconds(time));
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopPlay) name:AVPlayerItemDidPlayToEndTimeNotification object:  nil];
    _videolayer= [AVPlayerLayer playerLayerWithPlayer:_player];
    _videolayer.frame = attachV.frame;
    [attachV.layer addSublayer:_videolayer];
    
}

-(void) stopPlay {
    NSLog(@"stopPlay");
    [_videolayer removeFromSuperlayer];
    [_item removeObserver:self forKeyPath:@"status"];
    [_item removeObserver:self forKeyPath:@"loadedTimeRanges"];
    _item = nil;
    _player = nil;
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
