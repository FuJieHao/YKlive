//
//  YKHotLive.h
//
//  Created by   on 16/10/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface YKHotLive : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double expireTime;
@property (nonatomic, strong) NSArray *lives;
@property (nonatomic, assign) double dmError;
@property (nonatomic, strong) NSString *errorMsg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
