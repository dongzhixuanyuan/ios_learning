//
//  GTListItemModel.h
//  SampleApp
//
//  Created by liudong on 2020/3/30.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//{
//uniquekey: "99179ee3bed95d35ff6e85a5069a761a",
//title: "王者荣耀：使用辉月后最帅的几个英雄？最后一个变成黄金陀螺",
//date: "2020-04-02 19:23",
//category: "头条",
//author_name: "游戏日报",
//url: "https://v.juhe.cn/toutiao/s?id=https%3A%2F%2Fmini.eastday.com%2Fmobile%2F200402192341158.html",
//thumbnail_pic_s: "https://04imgmini.eastday.com/mobile/20200402/20200402192341_0c095a6cf8b1c036b11e48b07c2aa1d2_5_mwpm_03200403.jpg",
//thumbnail_pic_s02: "http://04imgmini.eastday.com/mobile/20200402/20200402192341_0c095a6cf8b1c036b11e48b07c2aa1d2_4_mwpm_03200403.jpg",
//thumbnail_pic_s03: "http://04imgmini.eastday.com/mobile/20200402/20200402192341_0c095a6cf8b1c036b11e48b07c2aa1d2_3_mwpm_03200403.jpg"
//},

@interface GTListItemModel : NSObject
@property(nonatomic,copy,readwrite)NSString* uniquekey ;
@property(nonatomic,copy,readwrite)NSString* title;
@property(nonatomic,copy,readwrite)NSString* date;
@property(nonatomic,copy,readwrite)NSString* category;
@property(nonatomic,copy,readwrite)NSString* author_name;
@property(nonatomic,copy,readwrite)NSString* url;
@property(nonatomic,copy,readwrite)NSString* thumbnail_pic_s;
-(void) initFromDictionary:(NSDictionary*) dictionary;
@end

NS_ASSUME_NONNULL_END
