//
//  GTListItemModel.m
//  SampleApp
//
//  Created by liudong on 2020/3/30.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTListItemModel.h"

@implementation GTListItemModel

- (void)initFromDictionary:(NSDictionary *)dictionary{
    self.uniquekey  = [dictionary objectForKey:@"uniquekey"];
    self.title= [dictionary objectForKey:@"title"];
    self.date= [dictionary objectForKey:@"date"];
    self.category= [dictionary objectForKey:@"category"];
    self.author_name= [dictionary objectForKey:@"author_name"];
    self.url= [dictionary objectForKey:@"url"];
    self.thumbnail_pic_s= [dictionary objectForKey:@"thumbnail_pic_s"];
}
@end
