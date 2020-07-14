//
//  Creator.m
//
//  Created by   on 16/10/27
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Creator.h"


NSString *const kCreatorId = @"id";
NSString *const kCreatorThirdPlatform = @"third_platform";
NSString *const kCreatorDescription = @"description";
NSString *const kCreatorRankVeri = @"rank_veri";
NSString *const kCreatorGmutex = @"gmutex";
NSString *const kCreatorVerified = @"verified";
NSString *const kCreatorEmotion = @"emotion";
NSString *const kCreatorNick = @"nick";
NSString *const kCreatorInkeVerify = @"inke_verify";
NSString *const kCreatorVerifiedReason = @"verified_reason";
NSString *const kCreatorBirth = @"birth";
NSString *const kCreatorLocation = @"location";
NSString *const kCreatorPortrait = @"portrait";
NSString *const kCreatorHometown = @"hometown";
NSString *const kCreatorLevel = @"level";
NSString *const kCreatorVeriInfo = @"veri_info";
NSString *const kCreatorGender = @"gender";
NSString *const kCreatorProfession = @"profession";


@interface Creator ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Creator

@synthesize creatorIdentifier = _creatorIdentifier;
@synthesize thirdPlatform = _thirdPlatform;
@synthesize creatorDescription = _creatorDescription;
@synthesize rankVeri = _rankVeri;
@synthesize gmutex = _gmutex;
@synthesize verified = _verified;
@synthesize emotion = _emotion;
@synthesize nick = _nick;
@synthesize inkeVerify = _inkeVerify;
@synthesize verifiedReason = _verifiedReason;
@synthesize birth = _birth;
@synthesize location = _location;
@synthesize portrait = _portrait;
@synthesize hometown = _hometown;
@synthesize level = _level;
@synthesize veriInfo = _veriInfo;
@synthesize gender = _gender;
@synthesize profession = _profession;


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
            self.creatorIdentifier = [[self objectOrNilForKey:kCreatorId fromDictionary:dict] doubleValue];
            self.thirdPlatform = [self objectOrNilForKey:kCreatorThirdPlatform fromDictionary:dict];
            self.creatorDescription = [self objectOrNilForKey:kCreatorDescription fromDictionary:dict];
            self.rankVeri = [[self objectOrNilForKey:kCreatorRankVeri fromDictionary:dict] doubleValue];
            self.gmutex = [[self objectOrNilForKey:kCreatorGmutex fromDictionary:dict] doubleValue];
            self.verified = [[self objectOrNilForKey:kCreatorVerified fromDictionary:dict] doubleValue];
            self.emotion = [self objectOrNilForKey:kCreatorEmotion fromDictionary:dict];
            self.nick = [self objectOrNilForKey:kCreatorNick fromDictionary:dict];
            self.inkeVerify = [[self objectOrNilForKey:kCreatorInkeVerify fromDictionary:dict] doubleValue];
            self.verifiedReason = [self objectOrNilForKey:kCreatorVerifiedReason fromDictionary:dict];
            self.birth = [self objectOrNilForKey:kCreatorBirth fromDictionary:dict];
            self.location = [self objectOrNilForKey:kCreatorLocation fromDictionary:dict];
            self.portrait = [self objectOrNilForKey:kCreatorPortrait fromDictionary:dict];
            self.hometown = [self objectOrNilForKey:kCreatorHometown fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kCreatorLevel fromDictionary:dict] doubleValue];
            self.veriInfo = [self objectOrNilForKey:kCreatorVeriInfo fromDictionary:dict];
            self.gender = [[self objectOrNilForKey:kCreatorGender fromDictionary:dict] doubleValue];
            self.profession = [self objectOrNilForKey:kCreatorProfession fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.creatorIdentifier] forKey:kCreatorId];
    [mutableDict setValue:self.thirdPlatform forKey:kCreatorThirdPlatform];
    [mutableDict setValue:self.creatorDescription forKey:kCreatorDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rankVeri] forKey:kCreatorRankVeri];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gmutex] forKey:kCreatorGmutex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verified] forKey:kCreatorVerified];
    [mutableDict setValue:self.emotion forKey:kCreatorEmotion];
    [mutableDict setValue:self.nick forKey:kCreatorNick];
    [mutableDict setValue:[NSNumber numberWithDouble:self.inkeVerify] forKey:kCreatorInkeVerify];
    [mutableDict setValue:self.verifiedReason forKey:kCreatorVerifiedReason];
    [mutableDict setValue:self.birth forKey:kCreatorBirth];
    [mutableDict setValue:self.location forKey:kCreatorLocation];
    [mutableDict setValue:self.portrait forKey:kCreatorPortrait];
    [mutableDict setValue:self.hometown forKey:kCreatorHometown];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kCreatorLevel];
    [mutableDict setValue:self.veriInfo forKey:kCreatorVeriInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gender] forKey:kCreatorGender];
    [mutableDict setValue:self.profession forKey:kCreatorProfession];

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

    self.creatorIdentifier = [aDecoder decodeDoubleForKey:kCreatorId];
    self.thirdPlatform = [aDecoder decodeObjectForKey:kCreatorThirdPlatform];
    self.creatorDescription = [aDecoder decodeObjectForKey:kCreatorDescription];
    self.rankVeri = [aDecoder decodeDoubleForKey:kCreatorRankVeri];
    self.gmutex = [aDecoder decodeDoubleForKey:kCreatorGmutex];
    self.verified = [aDecoder decodeDoubleForKey:kCreatorVerified];
    self.emotion = [aDecoder decodeObjectForKey:kCreatorEmotion];
    self.nick = [aDecoder decodeObjectForKey:kCreatorNick];
    self.inkeVerify = [aDecoder decodeDoubleForKey:kCreatorInkeVerify];
    self.verifiedReason = [aDecoder decodeObjectForKey:kCreatorVerifiedReason];
    self.birth = [aDecoder decodeObjectForKey:kCreatorBirth];
    self.location = [aDecoder decodeObjectForKey:kCreatorLocation];
    self.portrait = [aDecoder decodeObjectForKey:kCreatorPortrait];
    self.hometown = [aDecoder decodeObjectForKey:kCreatorHometown];
    self.level = [aDecoder decodeDoubleForKey:kCreatorLevel];
    self.veriInfo = [aDecoder decodeObjectForKey:kCreatorVeriInfo];
    self.gender = [aDecoder decodeDoubleForKey:kCreatorGender];
    self.profession = [aDecoder decodeObjectForKey:kCreatorProfession];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_creatorIdentifier forKey:kCreatorId];
    [aCoder encodeObject:_thirdPlatform forKey:kCreatorThirdPlatform];
    [aCoder encodeObject:_creatorDescription forKey:kCreatorDescription];
    [aCoder encodeDouble:_rankVeri forKey:kCreatorRankVeri];
    [aCoder encodeDouble:_gmutex forKey:kCreatorGmutex];
    [aCoder encodeDouble:_verified forKey:kCreatorVerified];
    [aCoder encodeObject:_emotion forKey:kCreatorEmotion];
    [aCoder encodeObject:_nick forKey:kCreatorNick];
    [aCoder encodeDouble:_inkeVerify forKey:kCreatorInkeVerify];
    [aCoder encodeObject:_verifiedReason forKey:kCreatorVerifiedReason];
    [aCoder encodeObject:_birth forKey:kCreatorBirth];
    [aCoder encodeObject:_location forKey:kCreatorLocation];
    [aCoder encodeObject:_portrait forKey:kCreatorPortrait];
    [aCoder encodeObject:_hometown forKey:kCreatorHometown];
    [aCoder encodeDouble:_level forKey:kCreatorLevel];
    [aCoder encodeObject:_veriInfo forKey:kCreatorVeriInfo];
    [aCoder encodeDouble:_gender forKey:kCreatorGender];
    [aCoder encodeObject:_profession forKey:kCreatorProfession];
}

- (id)copyWithZone:(NSZone *)zone
{
    Creator *copy = [[Creator alloc] init];
    
    if (copy) {

        copy.creatorIdentifier = self.creatorIdentifier;
        copy.thirdPlatform = [self.thirdPlatform copyWithZone:zone];
        copy.creatorDescription = [self.creatorDescription copyWithZone:zone];
        copy.rankVeri = self.rankVeri;
        copy.gmutex = self.gmutex;
        copy.verified = self.verified;
        copy.emotion = [self.emotion copyWithZone:zone];
        copy.nick = [self.nick copyWithZone:zone];
        copy.inkeVerify = self.inkeVerify;
        copy.verifiedReason = [self.verifiedReason copyWithZone:zone];
        copy.birth = [self.birth copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.portrait = [self.portrait copyWithZone:zone];
        copy.hometown = [self.hometown copyWithZone:zone];
        copy.level = self.level;
        copy.veriInfo = [self.veriInfo copyWithZone:zone];
        copy.gender = self.gender;
        copy.profession = [self.profession copyWithZone:zone];
    }
    
    return copy;
}


@end
