//
//  GTModulization.h
//  SampleApp
//
//  Created by liudong on 2020/4/12.
//  Copyright © 2020 liudong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef void(^schemaOpen)(NSDictionary*);

@protocol GTDetailViewProtocol <NSObject>
-(__kindof UIViewController*) initWithUrl:(NSURL*)url;
@end


@interface GTMediator : NSObject
//通过target action实现
+(__kindof UIViewController*) openDetailUrl:(NSString*)detailUrl;


+(void)openDetailUrlWithSchema:(NSString*) url params:(NSDictionary*)params; //通过schema打开
+(void)registerSchema:(NSString*)url callBack:(schemaOpen)block; //注册schema操作


//通过protocol实现
+(void)registerProtocol:(Protocol*) protocol class:(Class)cls;

+( nullable Class)classForProtocol:(Protocol*)protocol;

@end

NS_ASSUME_NONNULL_END
