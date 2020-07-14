//
//  Lives.m
//
//  Created by   on 16/10/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Lives.h"
#import "Creator.h"


NSString *const kLivesId = @"id";
NSString *const kLivesRoomId = @"room_id";
NSString *const kLivesOnlineUsers = @"online_users";
NSString *const kLivesRotate = @"rotate";
NSString *const kLivesVersion = @"version";
NSString *const kLivesMulti = @"multi";
NSString *const kLivesLink = @"link";
NSString *const kLivesShareAddr = @"share_addr";
NSString *const kLivesSlot = @"slot";
NSString *const kLivesCreator = @"creator";
NSString *const kLivesImage = @"image";
NSString *const kLivesCity = @"city";
NSString *const kLivesGroup = @"group";
NSString *const kLivesStreamAddr = @"stream_addr";
NSString *const kLivesPubStat = @"pub_stat";
NSString *const kLivesOptimal = @"optimal";
NSString *const kLivesName = @"name";
NSString *const kLivesStatus = @"status";


@interface Lives ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Lives

@synthesize livesIdentifier = _livesIdentifier;
@synthesize roomId = _roomId;
@synthesize onlineUsers = _onlineUsers;
@synthesize rotate = _rotate;
@synthesize version = _version;
@synthesize multi = _multi;
@synthesize link = _link;
@synthesize shareAddr = _shareAddr;
@synthesize slot = _slot;
@synthesize creator = _creator;
@synthesize image = _image;
@synthesize city = _city;
@synthesize group = _group;
@synthesize streamAddr = _streamAddr;
@synthesize pubStat = _pubStat;
@synthesize optimal = _optimal;
@synthesize name = _name;
@synthesize status = _status;


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
            self.livesIdentifier = [self objectOrNilForKey:kLivesId fromDictionary:dict];
            self.roomId = [[self objectOrNilForKey:kLivesRoomId fromDictionary:dict] doubleValue];
            self.onlineUsers = [[self objectOrNilForKey:kLivesOnlineUsers fromDictionary:dict] doubleValue];
            self.rotate = [[self objectOrNilForKey:kLivesRotate fromDictionary:dict] doubleValue];
            self.version = [[self objectOrNilForKey:kLivesVersion fromDictionary:dict] doubleValue];
            self.multi = [[self objectOrNilForKey:kLivesMulti fromDictionary:dict] doubleValue];
            self.link = [[self objectOrNilForKey:kLivesLink fromDictionary:dict] doubleValue];
            self.shareAddr = [self objectOrNilForKey:kLivesShareAddr fromDictionary:dict];
            self.slot = [[self objectOrNilForKey:kLivesSlot fromDictionary:dict] doubleValue];
            self.creator = [Creator modelObjectWithDictionary:[dict objectForKey:kLivesCreator]];
            self.image = [self objectOrNilForKey:kLivesImage fromDictionary:dict];
            self.city = [self objectOrNilForKey:kLivesCity fromDictionary:dict];
            self.group = [[self objectOrNilForKey:kLivesGroup fromDictionary:dict] doubleValue];
            self.streamAddr = [self objectOrNilForKey:kLivesStreamAddr fromDictionary:dict];
            self.pubStat = [[self objectOrNilForKey:kLivesPubStat fromDictionary:dict] doubleValue];
            self.optimal = [[self objectOrNilForKey:kLivesOptimal fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kLivesName fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kLivesStatus fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.livesIdentifier forKey:kLivesId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.roomId] forKey:kLivesRoomId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.onlineUsers] forKey:kLivesOnlineUsers];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rotate] forKey:kLivesRotate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.version] forKey:kLivesVersion];
    [mutableDict setValue:[NSNumber numberWithDouble:self.multi] forKey:kLivesMulti];
    [mutableDict setValue:[NSNumber numberWithDouble:self.link] forKey:kLivesLink];
    [mutableDict setValue:self.shareAddr forKey:kLivesShareAddr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.slot] forKey:kLivesSlot];
    [mutableDict setValue:[self.creator dictionaryRepresentation] forKey:kLivesCreator];
    [mutableDict setValue:self.image forKey:kLivesImage];
    [mutableDict setValue:self.city forKey:kLivesCity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.group] forKey:kLivesGroup];
    [mutableDict setValue:self.streamAddr forKey:kLivesStreamAddr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pubStat] forKey:kLivesPubStat];
    [mutableDict setValue:[NSNumber numberWithDouble:self.optimal] forKey:kLivesOptimal];
    [mutableDict setValue:self.name forKey:kLivesName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kLivesStatus];

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

    self.livesIdentifier = [aDecoder decodeObjectForKey:kLivesId];
    self.roomId = [aDecoder decodeDoubleForKey:kLivesRoomId];
    self.onlineUsers = [aDecoder decodeDoubleForKey:kLivesOnlineUsers];
    self.rotate = [aDecoder decodeDoubleForKey:kLivesRotate];
    self.version = [aDecoder decodeDoubleForKey:kLivesVersion];
    self.multi = [aDecoder decodeDoubleForKey:kLivesMulti];
    self.link = [aDecoder decodeDoubleForKey:kLivesLink];
    self.shareAddr = [aDecoder decodeObjectForKey:kLivesShareAddr];
    self.slot = [aDecoder decodeDoubleForKey:kLivesSlot];
    self.creator = [aDecoder decodeObjectForKey:kLivesCreator];
    self.image = [aDecoder decodeObjectForKey:kLivesImage];
    self.city = [aDecoder decodeObjectForKey:kLivesCity];
    self.group = [aDecoder decodeDoubleForKey:kLivesGroup];
    self.streamAddr = [aDecoder decodeObjectForKey:kLivesStreamAddr];
    self.pubStat = [aDecoder decodeDoubleForKey:kLivesPubStat];
    self.optimal = [aDecoder decodeDoubleForKey:kLivesOptimal];
    self.name = [aDecoder decodeObjectForKey:kLivesName];
    self.status = [aDecoder decodeDoubleForKey:kLivesStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_livesIdentifier forKey:kLivesId];
    [aCoder encodeDouble:_roomId forKey:kLivesRoomId];
    [aCoder encodeDouble:_onlineUsers forKey:kLivesOnlineUsers];
    [aCoder encodeDouble:_rotate forKey:kLivesRotate];
    [aCoder encodeDouble:_version forKey:kLivesVersion];
    [aCoder encodeDouble:_multi forKey:kLivesMulti];
    [aCoder encodeDouble:_link forKey:kLivesLink];
    [aCoder encodeObject:_shareAddr forKey:kLivesShareAddr];
    [aCoder encodeDouble:_slot forKey:kLivesSlot];
    [aCoder encodeObject:_creator forKey:kLivesCreator];
    [aCoder encodeObject:_image forKey:kLivesImage];
    [aCoder encodeObject:_city forKey:kLivesCity];
    [aCoder encodeDouble:_group forKey:kLivesGroup];
    [aCoder encodeObject:_streamAddr forKey:kLivesStreamAddr];
    [aCoder encodeDouble:_pubStat forKey:kLivesPubStat];
    [aCoder encodeDouble:_optimal forKey:kLivesOptimal];
    [aCoder encodeObject:_name forKey:kLivesName];
    [aCoder encodeDouble:_status forKey:kLivesStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    Lives *copy = [[Lives alloc] init];
    
    if (copy) {

        copy.livesIdentifier = [self.livesIdentifier copyWithZone:zone];
        copy.roomId = self.roomId;
        copy.onlineUsers = self.onlineUsers;
        copy.rotate = self.rotate;
        copy.version = self.version;
        copy.multi = self.multi;
        copy.link = self.link;
        copy.shareAddr = [self.shareAddr copyWithZone:zone];
        copy.slot = self.slot;
        copy.creator = [self.creator copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.group = self.group;
        copy.streamAddr = [self.streamAddr copyWithZone:zone];
        copy.pubStat = self.pubStat;
        copy.optimal = self.optimal;
        copy.name = [self.name copyWithZone:zone];
        copy.status = self.status;
    }
    
    return copy;
}


@end
