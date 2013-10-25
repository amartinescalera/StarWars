//
//  AMEHCharacters.h
//  StarWars
//
//  Created by Antonio Martin on 23/03/13.
//  Copyright (c) 2013 Antonio Martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMEHCharacter.h"

@interface AMEHCharacters : NSObject

@property (nonatomic, readonly) int rebelCount;
@property (nonatomic, readonly) int imperialCount;

- (AMEHCharacter*) rebelCharacterAtIndex: (int)index;
- (AMEHCharacter*) imperialCharacterAtIndex: (int)index;

@end
