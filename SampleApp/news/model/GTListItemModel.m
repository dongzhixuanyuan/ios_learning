//
//  GTListItemModel.m
//  SampleApp
//
//  Created by liudong on 2020/3/30.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTListItemModel.h"

@implementation GTListItemModel

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.author_name forKey:@"author_name"];
    [coder encodeObject:self.url forKey:@"url"];
    [coder encodeObject:self.thumbnail_pic_s forKey:@"thumbnail_pic_s"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    self.uniquekey = [coder decodeObjectForKey:@"uniquekey"];
    self.title = [coder decodeObjectForKey:@"title"];
    self.date = [coder decodeObjectForKey:@"date"];
    self.category = [coder decodeObjectForKey:@"category"];
    self.author_name = [coder decodeObjectForKey:@"author_name"];
    self.url = [coder decodeObjectForKey:@"url"];
    self.thumbnail_pic_s = [coder decodeObjectForKey:@"thumbnail_pic_s"];
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (void)initFromDictionary:(NSDictionary *)dictionary {
    self.uniquekey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.category = [dictionary objectForKey:@"category"];
    self.author_name = [dictionary objectForKey:@"author_name"];
    self.url = [dictionary objectForKey:@"url"];
    self.thumbnail_pic_s = [dictionary objectForKey:@"thumbnail_pic_s"];
}

@end
