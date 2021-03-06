//
//  HttpEngine.m
//  ZZ15191060WangPengYu
//
//  Created by Qianfeng on 16/2/20.
//  Copyright © 2016年 wangpengyu. All rights reserved.
//

#import "HttpEngine.h"
#import "AFNetworking.h"

@interface HttpEngine ()

@property (nonatomic,strong) AFHTTPRequestOperationManager *manger;

@end

@implementation HttpEngine
//声明一个单例
+ (instancetype)shareEngine  {
    static HttpEngine *engine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"只执行一次");
        engine = [[HttpEngine alloc]init];
    }) ;
    return engine;
}
- (instancetype)init {
    if (self = [super init]) {
        _manger = [AFHTTPRequestOperationManager manager];
        //
        
        
        
    }
    return self;
}

- (void)GET:(NSString*)URLString success:(SucessBlcokType)success failure:(FailedBlockType)failure  {
    
    _manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSSet *currentAcceptSet = self.manger.responseSerializer.acceptableContentTypes;
    NSMutableSet *mset = [NSMutableSet setWithSet:currentAcceptSet];
    [mset addObject:@"text/html"];
    [mset addObject:@"application/json"];
  self.manger.responseSerializer.acceptableContentTypes = mset;
    [_manger GET:URLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
