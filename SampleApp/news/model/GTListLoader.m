//
//  GTListLoader.m
//  SampleApp
//
//  Created by liudong on 2020/3/29.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListItemModel.h"
@implementation GTListLoader
- (void)loadListData:(GTListLoaderFinishBlock)block {
    NSString *urlStr = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
//    [[AFHTTPSessionManager manager] GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"success");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"failure");
//    }];
    __unused NSURL *url = [NSURL URLWithString:urlStr];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        NSLog(@"");
        NSError *jsonError;
        id jsonObj =  [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray* dataArray = (NSArray*)[[jsonObj objectForKey:@"result"]objectForKey:@"data"];
        NSMutableArray* modelArray = @[].mutableCopy;
        for (NSDictionary* info in dataArray) {
            GTListItemModel* item = [GTListItemModel alloc];
            [item initFromDictionary:info];
            [modelArray addObject:item];
        }
        dispatch_sync(dispatch_get_main_queue(), ^{
            block(error == nil,modelArray.copy);
        });
        
        NSLog(@"");
    }];

    [task resume];
}

@end
