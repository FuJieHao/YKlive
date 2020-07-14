//
//  YKHotLive.m
//
//  Created by   on 16/10/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "YKHotLive.h"
#import "Lives.h"


NSString *const kYKHotLiveExpireTime = @"expire_time";
NSString *const kYKHotLiveLives = @"lives";
NSString *const kYKHotLiveDmError = @"dm_error";
NSString *const kYKHotLiveErrorMsg = @"error_msg";


@interface YKHotLive ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation YKHotLive

@synthesize expireTime = _expireTime;
@synthesize lives = _lives;
@synthesize dmError = _dmError;
@synthesize errorMsg = _errorMsg;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.expireTime = [[self objectOrNilForKey:kYKHotLiveExpireTime fromDictionary:dict] doubleValue];
    NSObject *receivedLives = [dict objectForKey:kYKHotLiveLives];
    NSMutableArray *parsedLives = [NSMutableArray array];
    if ([receivedLives isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLives) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLives addObject:[Lives modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLives isKindOfClass:[NSDictionary class]]) {
       [parsedLives addObject:[Lives modelObjectWithDictionary:(NSDictionary *)receivedLives]];
    }

    self.lives = [NSArray arrayWithArray:parsedLives];
            self.dmError = [[self objectOrNilForKey:kYKHotLiveDmError fromDictionary:dict] doubleValue];
            self.errorMsg = [self objectOrNilForKey:kYKHotLiveErrorMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expireTime] forKey:kYKHotLiveExpireTime];
    NSMutableArray *tempArrayForLives = [NSMutableArray array];
    for (NSObject *subArrayObject in self.lives) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLives addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLives addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLives] forKey:kYKHotLiveLives];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dmError] forKey:kYKHotLiveDmError];
    [mutableDict setValue:self.errorMsg forKey:kYKHotLiveErrorMsg];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.expireTime = [aDecoder decodeDoubleForKey:kYKHotLiveExpireTime];
    self.lives = [aDecoder decodeObjectForKey:kYKHotLiveLives];
    self.dmError = [aDecoder decodeDoubleForKey:kYKHotLiveDmError];
    self.errorMsg = [aDecoder decodeObjectForKey:kYKHotLiveErrorMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_expireTime forKey:kYKHotLiveExpireTime];
    [aCoder encodeObject:_lives forKey:kYKHotLiveLives];
    [aCoder encodeDouble:_dmError forKey:kYKHotLiveDmError];
    [aCoder encodeObject:_errorMsg forKey:kYKHotLiveErrorMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    YKHotLive *copy = [[YKHotLive alloc] init];
    
    if (copy) {

        copy.expireTime = self.expireTime;
        copy.lives = [self.lives copyWithZone:zone];
        copy.dmError = self.dmError;
        copy.errorMsg = [self.errorMsg copyWithZone:zone];
    }
    
    return copy;
}


@end
