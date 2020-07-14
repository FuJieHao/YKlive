//
//  YKNearCreator.m
//
//  Created by   on 16/10/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "YKNearCreator.h"


NSString *const kYKNearCreatorGender = @"gender";
NSString *const kYKNearCreatorId = @"id";
NSString *const kYKNearCreatorLevel = @"level";
NSString *const kYKNearCreatorNick = @"nick";
NSString *const kYKNearCreatorPortrait = @"portrait";


@interface YKNearCreator ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation YKNearCreator

@synthesize gender = _gender;
@synthesize creatorIdentifier = _creatorIdentifier;
@synthesize level = _level;
@synthesize nick = _nick;
@synthesize portrait = _portrait;


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
            self.gender = [[self objectOrNilForKey:kYKNearCreatorGender fromDictionary:dict] doubleValue];
            self.creatorIdentifier = [[self objectOrNilForKey:kYKNearCreatorId fromDictionary:dict] doubleValue];
            self.level = [[self objectOrNilForKey:kYKNearCreatorLevel fromDictionary:dict] doubleValue];
            self.nick = [self objectOrNilForKey:kYKNearCreatorNick fromDictionary:dict];
            self.portrait = [self objectOrNilForKey:kYKNearCreatorPortrait fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gender] forKey:kYKNearCreatorGender];
    [mutableDict setValue:[NSNumber numberWithDouble:self.creatorIdentifier] forKey:kYKNearCreatorId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kYKNearCreatorLevel];
    [mutableDict setValue:self.nick forKey:kYKNearCreatorNick];
    [mutableDict setValue:self.portrait forKey:kYKNearCreatorPortrait];

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

    self.gender = [aDecoder decodeDoubleForKey:kYKNearCreatorGender];
    self.creatorIdentifier = [aDecoder decodeDoubleForKey:kYKNearCreatorId];
    self.level = [aDecoder decodeDoubleForKey:kYKNearCreatorLevel];
    self.nick = [aDecoder decodeObjectForKey:kYKNearCreatorNick];
    self.portrait = [aDecoder decodeObjectForKey:kYKNearCreatorPortrait];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_gender forKey:kYKNearCreatorGender];
    [aCoder encodeDouble:_creatorIdentifier forKey:kYKNearCreatorId];
    [aCoder encodeDouble:_level forKey:kYKNearCreatorLevel];
    [aCoder encodeObject:_nick forKey:kYKNearCreatorNick];
    [aCoder encodeObject:_portrait forKey:kYKNearCreatorPortrait];
}

- (id)copyWithZone:(NSZone *)zone
{
    YKNearCreator *copy = [[YKNearCreator alloc] init];
    
    if (copy) {

        copy.gender = self.gender;
        copy.creatorIdentifier = self.creatorIdentifier;
        copy.level = self.level;
        copy.nick = [self.nick copyWithZone:zone];
        copy.portrait = [self.portrait copyWithZone:zone];
    }
    
    return copy;
}


@end
