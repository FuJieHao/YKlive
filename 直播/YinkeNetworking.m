//
//  YinkeNetworking.m
//  直播
//
//  Created by Mac on 16/10/27.
//  Copyright © 2016年 haofujie. All rights reserved.
//

#import "YinkeNetworking.h"

@implementation YinkeNetworking

+ (instancetype)sharedToolsWithBaseUrl:(BaseUrl)baseUrl
{
    static YinkeNetworking *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
//        if (baseUrl == ImgServer) {
//            instance = [[YinkeNetworking alloc]initWithBaseURL:[NSURL URLWithString:ImageServerHost]];
//        } else {
            instance = [[YinkeNetworking alloc]initWithBaseURL:[NSURL URLWithString:ServerHost]];
//        }
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/x-gzip",@"text/plain", nil];
        instance.requestSerializer.timeoutInterval = 15.0;
    });
    
    
    return instance;
}

- (void)requestURLString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))sucess falied:(void (^)(NSError *error))falied
{
    
    [self GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        sucess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        falied(error);
    }];
}

@end
