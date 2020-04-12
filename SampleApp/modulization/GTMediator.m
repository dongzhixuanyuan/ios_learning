//
//  GTModulization.m
//  SampleApp
//
//  Created by liudong on 2020/4/12.
//  Copyright © 2020 liudong. All rights reserved.
//

#import "GTMediator.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@implementation GTMediator
+ (__kindof UIViewController *)openDetailUrl:(NSString *)detailUrl {
    Class webViewController = NSClassFromString(@"GTDetailViewController");
    NSURL *url = [NSURL URLWithString:detailUrl];
    UIViewController *controller = [webViewController alloc];
    SEL selector = NSSelectorFromString(@"initWithUrl:");
    BOOL hasSelector = [controller respondsToSelector:selector];

    [ controller performSelector:selector withObject:url];
    return controller;
}

+ (NSMutableDictionary *)mediatorCache {
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[NSMutableDictionary alloc]init];
    });
    return cache;
}

+ (void)openDetailUrlWithSchema:(NSString *)url params:(NSDictionary *)params {
    schemaOpen block = [[[self class]mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

//注册schema
+ (void)registerSchema:(NSString *)url callBack:(schemaOpen)block {
    if (url && block) {
        [[[self class] mediatorCache] setObject:block forKey:url];
    }
}

+ (void)
registerProtocol:(Protocol *)protocol class:(Class)cls {
    if(protocol && cls){
        [[[self class] mediatorCache]setObject:cls forKey: NSStringFromProtocol(protocol)];
    }
}

+ (Class)classForProtocol:(Protocol *)protocol {
    return [[[self class]mediatorCache]objectForKey: NSStringFromProtocol(protocol)];
}

@end
