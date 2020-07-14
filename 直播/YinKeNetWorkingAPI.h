//
//  YinKeNetWorkingAPI.h
//  直播
//
//  Created by Mac on 16/10/27.
//  Copyright © 2016年 haofujie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YinKeNetWorkingAPI : NSObject

//服务器地址
#define ServerHost @"http://service.ingkee.com"
//图片服务器地址
#define ImageServerHost @"http://img.meelive.cn/"

//热门直播
#define YK_HotLive @"api/live/gettop"

//附近的人
#define YK_NearLive @"api/live/near_recommend"
//? uid = xxxx & latitude = xxxx & longitude = xxxxx

//广告地址
#define YK_ADvertise @"advertise/get"

@end
