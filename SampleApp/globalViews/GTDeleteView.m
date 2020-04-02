//
//  GTDeleteView.m
//  SampleApp
//
//  Created by liudong on 2020/3/28.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTDeleteView.h"


@interface GTDeleteView()

@property (strong,nonatomic,readwrite)UIView* background;
@property (strong,nonatomic,readwrite)UIButton* deleteBtn;
@property (copy,nonatomic,readwrite) dispatch_block_t clickBlock;

@end

@implementation GTDeleteView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    _background = [[UIView alloc]initWithFrame:self.bounds];
    _background.backgroundColor = [UIColor grayColor];
    _background.alpha = 0.5;
    [_background addGestureRecognizer:({
        UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
        gesture;
    })];
    [self addSubview:_background];
    
    _deleteBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0 , 0)];
    _deleteBtn.backgroundColor = [UIColor blueColor];
    [_deleteBtn addTarget:self action:@selector(_deleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_deleteBtn];
    return self;
}


-(void) showAtPoint:(CGPoint)point clickblock :(dispatch_block_t) clickCallback {
    
    self.clickBlock = [clickCallback copy];
    _deleteBtn.frame = CGRectMake(point.x, point.y, 200, 200);
    [[UIApplication sharedApplication].keyWindow addSubview:self];

    CAKeyframeAnimation* animation1 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation1.keyTimes = @[@(0),@(0.5),@(1)];
    animation1.values = @[@(1),@(1.3),@(1.2)];
    animation1.duration = 1.0f;
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    
    CAKeyframeAnimation* animation2 = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    animation2.keyTimes = @[@(0),@(0.5),@(1)];
    animation2.values = @[@(0),@(0.5),@(1.0)];
    
    
    CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 1.0f;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.animations = @[animation1,animation2];
    
    [self.deleteBtn.layer addAnimation:animationGroup forKey:@"animationGroup"];
    
    
    
    
    
    //
    //
    //    [UIView animateWithDuration:1.0f delay:0.0f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
    //        self.deleteBtn.frame = CGRectMake((self.frame.size.width-200)/2, (self.frame.size.height-200)/2, 200, 200);
    //    } completion:^(BOOL finished) {
    //        NSLog(@"动画结束");
    //    }];
    
}

-(void) hide{
    [self removeFromSuperview];
}


-(void)_deleteBtnClick{
    if(self.clickBlock){
        self.clickBlock();
    }
    [self hide];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
