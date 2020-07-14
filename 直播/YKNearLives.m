//
//  YKNearLives.m
//
//  Created by   on 16/10/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "YKNearLives.h"
#import "YKNearCreator.h"


NSString *const kYKNearLivesId = @"id";
NSString *const kYKNearLivesRotate = @"rotate";
NSString *const kYKNearLivesVersion = @"version";
NSString *const kYKNearLivesMulti = @"multi";
NSString *const kYKNearLivesLink = @"link";
NSString *const kYKNearLivesTagId = @"tag_id";
NSString *const kYKNearLivesShareAddr = @"share_addr";
NSString *const kYKNearLivesSlot = @"slot";
NSString *const kYKNearLivesCreator = @"creator";
NSString *const kYKNearLivesGroup = @"group";
NSString *const kYKNearLivesCity = @"city";
NSString *const kYKNearLivesOptimal = @"optimal";
NSString *const kYKNearLivesStreamAddr = @"stream_addr";
NSString *const kYKNearLivesDistance = @"distance";
NSString *const kYKNearLivesName = @"name";


@interface YKNearLives ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation YKNearLives

@synthesize livesIdentifier = _livesIdentifier;
@synthesize rotate = _rotate;
@synthesize version = _version;
@synthesize multi = _multi;
@synthesize link = _link;
@synthesize tagId = _tagId;
@synthesize shareAddr = _shareAddr;
@synthesize slot = _slot;
@synthesize creator = _creator;
@synthesize group = _group;
@synthesize city = _city;
@synthesize optimal = _optimal;
@synthesize streamAddr = _streamAddr;
@synthesize distance = _distance;
@synthesize name = _name;


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
            self.livesIdentifier = [self objectOrNilForKey:kYKNearLivesId fromDictionary:dict];
            self.rotate = [[self objectOrNilForKey:kYKNearLivesRotate fromDictionary:dict] doubleValue];
            self.version = [[self objectOrNilForKey:kYKNearLivesVersion fromDictionary:dict] doubleValue];
            self.multi = [[self objectOrNilForKey:kYKNearLivesMulti fromDictionary:dict] doubleValue];
            self.link = [[self objectOrNilForKey:kYKNearLivesLink fromDictionary:dict] doubleValue];
            self.tagId = [[self objectOrNilForKey:kYKNearLivesTagId fromDictionary:dict] doubleValue];
            self.shareAddr = [self objectOrNilForKey:kYKNearLivesShareAddr fromDictionary:dict];
            self.slot = [[self objectOrNilForKey:kYKNearLivesSlot fromDictionary:dict] doubleValue];
            self.creator = [YKNearCreator modelObjectWithDictionary:[dict objectForKey:kYKNearLivesCreator]];
            self.group = [[self objectOrNilForKey:kYKNearLivesGroup fromDictionary:dict] doubleValue];
            self.city = [self objectOrNilForKey:kYKNearLivesCity fromDictionary:dict];
            self.optimal = [[self objectOrNilForKey:kYKNearLivesOptimal fromDictionary:dict] doubleValue];
            self.streamAddr = [self objectOrNilForKey:kYKNearLivesStreamAddr fromDictionary:dict];
            self.distance = [self objectOrNilForKey:kYKNearLivesDistance fromDictionary:dict];
            self.name = [self objectOrNilForKey:kYKNearLivesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.livesIdentifier forKey:kYKNearLivesId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rotate] forKey:kYKNearLivesRotate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.version] forKey:kYKNearLivesVersion];
    [mutableDict setValue:[NSNumber numberWithDouble:self.multi] forKey:kYKNearLivesMulti];
    [mutableDict setValue:[NSNumber numberWithDouble:self.link] forKey:kYKNearLivesLink];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tagId] forKey:kYKNearLivesTagId];
    [mutableDict setValue:self.shareAddr forKey:kYKNearLivesShareAddr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.slot] forKey:kYKNearLivesSlot];
    [mutableDict setValue:[self.creator dictionaryRepresentation] forKey:kYKNearLivesCreator];
    [mutableDict setValue:[NSNumber numberWithDouble:self.group] forKey:kYKNearLivesGroup];
    [mutableDict setValue:self.city forKey:kYKNearLivesCity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.optimal] forKey:kYKNearLivesOptimal];
    [mutableDict setValue:self.streamAddr forKey:kYKNearLivesStreamAddr];
    [mutableDict setValue:self.distance forKey:kYKNearLivesDistance];
    [mutableDict setValue:self.name forKey:kYKNearLivesName];

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

    self.livesIdentifier = [aDecoder decodeObjectForKey:kYKNearLivesId];
    self.rotate = [aDecoder decodeDoubleForKey:kYKNearLivesRotate];
    self.version = [aDecoder decodeDoubleForKey:kYKNearLivesVersion];
    self.multi = [aDecoder decodeDoubleForKey:kYKNearLivesMulti];
    self.link = [aDecoder decodeDoubleForKey:kYKNearLivesLink];
    self.tagId = [aDecoder decodeDoubleForKey:kYKNearLivesTagId];
    self.shareAddr = [aDecoder decodeObjectForKey:kYKNearLivesShareAddr];
    self.slot = [aDecoder decodeDoubleForKey:kYKNearLivesSlot];
    self.creator = [aDecoder decodeObjectForKey:kYKNearLivesCreator];
    self.group = [aDecoder decodeDoubleForKey:kYKNearLivesGroup];
    self.city = [aDecoder decodeObjectForKey:kYKNearLivesCity];
    self.optimal = [aDecoder decodeDoubleForKey:kYKNearLivesOptimal];
    self.streamAddr = [aDecoder decodeObjectForKey:kYKNearLivesStreamAddr];
    self.distance = [aDecoder decodeObjectForKey:kYKNearLivesDistance];
    self.name = [aDecoder decodeObjectForKey:kYKNearLivesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_livesIdentifier forKey:kYKNearLivesId];
    [aCoder encodeDouble:_rotate forKey:kYKNearLivesRotate];
    [aCoder encodeDouble:_version forKey:kYKNearLivesVersion];
    [aCoder encodeDouble:_multi forKey:kYKNearLivesMulti];
    [aCoder encodeDouble:_link forKey:kYKNearLivesLink];
    [aCoder encodeDouble:_tagId forKey:kYKNearLivesTagId];
    [aCoder encodeObject:_shareAddr forKey:kYKNearLivesShareAddr];
    [aCoder encodeDouble:_slot forKey:kYKNearLivesSlot];
    [aCoder encodeObject:_creator forKey:kYKNearLivesCreator];
    [aCoder encodeDouble:_group forKey:kYKNearLivesGroup];
    [aCoder encodeObject:_city forKey:kYKNearLivesCity];
    [aCoder encodeDouble:_optimal forKey:kYKNearLivesOptimal];
    [aCoder encodeObject:_streamAddr forKey:kYKNearLivesStreamAddr];
    [aCoder encodeObject:_distance forKey:kYKNearLivesDistance];
    [aCoder encodeObject:_name forKey:kYKNearLivesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    YKNearLives *copy = [[YKNearLives alloc] init];
    
    if (copy) {

        copy.livesIdentifier = [self.livesIdentifier copyWithZone:zone];
        copy.rotate = self.rotate;
        copy.version = self.version;
        copy.multi = self.multi;
        copy.link = self.link;
        copy.tagId = self.tagId;
        copy.shareAddr = [self.shareAddr copyWithZone:zone];
        copy.slot = self.slot;
        copy.creator = [self.creator copyWithZone:zone];
        copy.group = self.group;
        copy.city = [self.city copyWithZone:zone];
        copy.optimal = self.optimal;
        copy.streamAddr = [self.streamAddr copyWithZone:zone];
        copy.distance = [self.distance copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
