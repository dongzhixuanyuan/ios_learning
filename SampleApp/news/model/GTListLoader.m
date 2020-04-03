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
    __weak typeof (self) weakSelf = self;
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
        __strong typeof (self) strongSelf = weakSelf;
        
        [strongSelf saveToStorage:modelArray];
        
        NSLog(@"");
    }];

    [task resume];
    
}


-(void)saveToStorage: (NSArray<GTListItemModel*>*) array {
    NSArray<NSString*>*   paths =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString* newDir = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"GTData"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError* error = [[NSError alloc] init];
    [fileManager createDirectoryAtPath:newDir withIntermediateDirectories:YES attributes:nil error:&error];
    NSString* newFile = [newDir stringByAppendingPathComponent:@"list"];
    
    NSData* itemsBytes = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:newFile contents:itemsBytes attributes:nil];
    
    NSData* cacheData = [fileManager contentsAtPath:newFile];
    
    
    
    NSArray<GTListItemModel*>* modelFromCache = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects: [NSArray class],[GTListItemModel class] , nil] fromData:cacheData error:nil];
    
    
//    BOOL exist = [fileManager fileExistsAtPath:newFile];
//
//    NSLog(exist ? @"yes":@"no");
//
//    NSFileHandle* handle = [NSFileHandle fileHandleForUpdatingAtPath:newFile];
//    [handle seekToEndOfFile];
//    [ handle writeData: [@"def" dataUsingEncoding:NSUTF8StringEncoding] ];
//    [handle synchronizeFile];
//    [handle closeFile];

    
    
    
    
    NSLog(@"");
    
    
    
}
@end
