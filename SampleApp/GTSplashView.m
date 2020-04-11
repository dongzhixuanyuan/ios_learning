//
//  GTSplashView.m
//  SampleApp
//
//  Created by liudong on 2020/4/11.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTSplashView.h"
#import "UIAdapter.h"
@interface GTSplashView()
@property(nonatomic,strong,readwrite)UIButton* button;
@end


@implementation GTSplashView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"splash"];
        [self addSubview:({
            _button = [[UIButton alloc]initWithFrame:UIRectAdapter(300, 40, 60,40 )];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            _button.backgroundColor = [UIColor lightGrayColor];
         
            
            self.userInteractionEnabled =   YES;
            [_button addTarget:self action:@selector(_removeFromWindow) forControlEvents:UIControlEventTouchUpInside];
            _button;
        })];
    }
    return self;
}

-(void)_removeFromWindow {
    [self removeFromSuperview];
}
@end
