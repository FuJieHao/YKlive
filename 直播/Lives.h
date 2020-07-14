//
//  Lives.h
//
//  Created by   on 16/10/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Creator;

@interface Lives : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *livesIdentifier;
@property (nonatomic, assign) double roomId;
@property (nonatomic, assign) double onlineUsers;
@property (nonatomic, assign) double rotate;
@property (nonatomic, assign) double version;
@property (nonatomic, assign) double multi;
@property (nonatomic, assign) double link;
@property (nonatomic, strong) NSString *shareAddr;
@property (nonatomic, assign) double slot;
@property (nonatomic, strong) Creator *creator;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, assign) double group;
@property (nonatomic, strong) NSString *streamAddr;
@property (nonatomic, assign) double pubStat;
@property (nonatomic, assign) double optimal;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
