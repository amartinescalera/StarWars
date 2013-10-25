//
//  AMEHCharacter.m
//  StarWars
//
//  Created by Antonio Martin on 22/03/13.
//  Copyright (c) 2013 Antonio Martin. All rights reserved.
//

#import "AMEHCharacter.h"

@implementation AMEHCharacter

-(id) initWithFirstName: (NSString*) firstName
               lastName: (NSString*) lastName
                  alias: (NSString*) alias
                   wiki: (NSURL*) wiki
                  sound: (NSData*) sound
                  image: (UIImage*) image{
    
    if (self = [super init]) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.alias = alias;
        self.wiki = wiki;
        self.sound = sound;
        self.image = image;
    }
    
    return self;
    
    
}

+(id) characterWithFirstName: (NSString*) firstName
               lastName: (NSString*) lastName
                  alias: (NSString*) alias
                        wiki: (NSURL*) wiki
                       sound: (NSData*) sound
                       image: (UIImage*) image{
    
    return [[AMEHCharacter alloc] initWithFirstName:firstName lastName:lastName alias:alias wiki:wiki sound:sound image:image];
    
}

-(id) initWithAlias: (NSString*) alias
               wiki: (NSURL*) wiki
              sound: (NSData*) sound
              image: (UIImage*) image{
    return [self initWithFirstName:@"" lastName:@"" alias:alias wiki:wiki sound: sound image:image];
}


@end
