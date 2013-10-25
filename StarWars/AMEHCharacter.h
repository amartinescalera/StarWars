//
//  AMEHCharacter.h
//  StarWars
//
//  Created by Antonio Martin on 22/03/13.
//  Copyright (c) 2013 Antonio Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMEHCharacter : NSObject

@property (nonatomic, copy) NSString* firstName;
@property (nonatomic, copy) NSString* lastName;
@property (nonatomic, copy) NSString* alias;
@property (nonatomic, strong) NSURL* wiki;
@property (nonatomic, strong) NSData* sound;
@property (nonatomic, strong) UIImage* image;

-(id) initWithFirstName: (NSString*) firstName
               lastName: (NSString*) lastName
                  alias: (NSString*) alias
                   wiki: (NSURL*) wiki
                  sound: (NSData*) sound
                  image: (UIImage*) image;

+(id) characterWithFirstName: (NSString*) firstName
                    lastName: (NSString*) lastName
                       alias: (NSString*) alias
                        wiki: (NSURL*) wiki
                       sound: (NSData*) sound
                       image: (UIImage*) image;

-(id) initWithAlias: (NSString*) alias
               wiki: (NSURL*) wiki
              sound: (NSData*) sound
              image: (UIImage*) image;

@end
