//
//  UIAdapter.m
//  SampleApp
//
//  Created by liudong on 2020/4/9.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "UIAdapter.h"

@implementation GTScreen

+ (CGSize)sizeFor65Inch{
        return CGSizeMake(414, 896);
}
+ (CGSize)sizeFor61Inch {
    return CGSizeMake(414, 896);
}
+ (CGSize)sizeFor58Inch {
    return CGSizeMake(375, 812);
}

@end
