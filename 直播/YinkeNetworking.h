//
//  YinkeNetworking.h
//  直播
//
//  Created by Mac on 16/10/27.
//  Copyright © 2016年 haofujie. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef enum {
    
    ImgServer,
    JsonServer
    
}BaseUrl;

@interface YinkeNetworking : AFHTTPSessionManager

+ (instancetype)sharedToolsWithBaseUrl:(BaseUrl)baseUrl;

- (void)requestURLString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))sucess falied:(void (^)(NSError *error))falied;

@end
