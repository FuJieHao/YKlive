//
//  YKNearLives.h
//
//  Created by   on 16/10/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YKNearCreator;

@interface YKNearLives : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *livesIdentifier;
@property (nonatomic, assign) double rotate;
@property (nonatomic, assign) double version;
@property (nonatomic, assign) double multi;
@property (nonatomic, assign) double link;
@property (nonatomic, assign) double tagId;
@property (nonatomic, strong) NSString *shareAddr;
@property (nonatomic, assign) double slot;
@property (nonatomic, strong) YKNearCreator *creator;
@property (nonatomic, assign) double group;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, assign) double optimal;
@property (nonatomic, strong) NSString *streamAddr;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign ,getter=isShow) BOOL show;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
