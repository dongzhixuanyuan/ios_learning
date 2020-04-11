//
//  UIAdapter.h
//  SampleApp
//
//  Created by liudong on 2020/4/9.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

#define IS_LANDSCAPE  (UIInterfaceOrientationIsLandscape([[[UIApplication sharedApplication] windows] firstObject].windowScene.interfaceOrientation))
#define SCREEN_WIDTH  (IS_LANDSCAPE ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)

#define IS_IPHONE_X (SCREEN_WIDTH == [GTScreen sizeFor58Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor58Inch].height)
#define IS_IPHONE_XMAX (SCREEN_WIDTH == [GTScreen sizeFor65Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)
#define IS_IPHONE_XR (SCREEN_WIDTH == [GTScreen sizeFor65Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor65Inch].height && [UIScreen mainScreen].scale == 2)

#define IS_IPHONEX_XR_XMAX (IS_IPHONE_X || IS_IPHONE_XMAX || IS_IPHONE_XR)
#define STATUSBAR_HEIGHT (IS_IPHONEX_XR_XMAX ? 44 : 20)


#define UI(x)                       UIAdapter(x)
#define UIRect(x, y, width, height) UIRectAdapter(x, y, width, height)

static inline NSInteger UIAdapter(float x)
{
    CGFloat scale = 414 / SCREEN_WIDTH;
    return (NSInteger)x / scale;
}

static inline CGRect  UIRectAdapter(x, y, width, height)
{
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

@interface GTScreen : NSObject

//iphonexs max
+(CGSize) sizeFor65Inch;
//iphone xr
+(CGSize) sizeFor61Inch;
//iphone x
+(CGSize) sizeFor58Inch;


@end

NS_ASSUME_NONNULL_END
