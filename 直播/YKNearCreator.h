//
//  YKNearCreator.h
//
//  Created by   on 16/10/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface YKNearCreator : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double gender;
@property (nonatomic, assign) double creatorIdentifier;
@property (nonatomic, assign) double level;
@property (nonatomic, strong) NSString *nick;
@property (nonatomic, strong) NSString *portrait;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
