//
//  YKNearPerson.m
//
//  Created by   on 16/10/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "YKNearPerson.h"
#import "YKNearLives.h"


NSString *const kYKNearPersonExpireTime = @"expire_time";
NSString *const kYKNearPersonLives = @"lives";
NSString *const kYKNearPersonDmError = @"dm_error";
NSString *const kYKNearPersonErrorMsg = @"error_msg";


@interface YKNearPerson ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation YKNearPerson

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
            self.expireTime = [[self objectOrNilForKey:kYKNearPersonExpireTime fromDictionary:dict] doubleValue];
    NSObject *receivedYKNearLives = [dict objectForKey:kYKNearPersonLives];
    NSMutableArray *parsedYKNearLives = [NSMutableArray array];
    if ([receivedYKNearLives isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedYKNearLives) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedYKNearLives addObject:[YKNearLives modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedYKNearLives isKindOfClass:[NSDictionary class]]) {
       [parsedYKNearLives addObject:[YKNearLives modelObjectWithDictionary:(NSDictionary *)receivedYKNearLives]];
    }

    self.lives = [NSArray arrayWithArray:parsedYKNearLives];
            self.dmError = [[self objectOrNilForKey:kYKNearPersonDmError fromDictionary:dict] doubleValue];
            self.errorMsg = [self objectOrNilForKey:kYKNearPersonErrorMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expireTime] forKey:kYKNearPersonExpireTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLives] forKey:kYKNearPersonLives];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dmError] forKey:kYKNearPersonDmError];
    [mutableDict setValue:self.errorMsg forKey:kYKNearPersonErrorMsg];

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

    self.expireTime = [aDecoder decodeDoubleForKey:kYKNearPersonExpireTime];
    self.lives = [aDecoder decodeObjectForKey:kYKNearPersonLives];
    self.dmError = [aDecoder decodeDoubleForKey:kYKNearPersonDmError];
    self.errorMsg = [aDecoder decodeObjectForKey:kYKNearPersonErrorMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_expireTime forKey:kYKNearPersonExpireTime];
    [aCoder encodeObject:_lives forKey:kYKNearPersonLives];
    [aCoder encodeDouble:_dmError forKey:kYKNearPersonDmError];
    [aCoder encodeObject:_errorMsg forKey:kYKNearPersonErrorMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    YKNearPerson *copy = [[YKNearPerson alloc] init];
    
    if (copy) {

        copy.expireTime = self.expireTime;
        copy.lives = [self.lives copyWithZone:zone];
        copy.dmError = self.dmError;
        copy.errorMsg = [self.errorMsg copyWithZone:zone];
    }
    
    return copy;
}


@end
