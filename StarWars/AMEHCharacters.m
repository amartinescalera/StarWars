//
//  AMEHCharacters.m
//  StarWars
//
//  Created by Antonio Martin on 23/03/13.
//  Copyright (c) 2013 Antonio Martin. All rights reserved.
//

#import "AMEHCharacters.h"
#import "AMEHCharacter.h"

@interface AMEHCharacters ()

@property (nonatomic, strong) NSArray* rebelCharacters;
@property (nonatomic, strong) NSArray* imperialCharacters;

@end

@implementation AMEHCharacters

- (id)init
{
    self = [super init];
    if (self) {
    
        //Chewbacca
        UIImage* chewiePhoto = [UIImage imageNamed:@"chewbacca.jpg"];
        NSData* chewieSound = [NSData dataWithContentsOfURL:
                               [[NSBundle mainBundle] URLForResource:@"chewbacca"
                                                       withExtension:@".caf"]];
        NSURL * chewieWiki = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Chewbacca"];
        AMEHCharacter *chewie = [[AMEHCharacter alloc] initWithAlias:@"Chewbacca" wiki:chewieWiki sound:chewieSound image:chewiePhoto];
        
        
        UIImage* anakinPhoto = [UIImage imageNamed:@"darthVader.jpg"];
        NSData* anakinSound = [NSData dataWithContentsOfURL:
                               [[NSBundle mainBundle] URLForResource:@"vader"
                                                       withExtension:@".caf"]];
        NSURL* anakinWiki = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Darth_Vader"];
        AMEHCharacter *anakin = [[AMEHCharacter alloc] initWithFirstName:@"Anakin" lastName:@"Skywalker" alias:@"Darth Vader" wiki:anakinWiki sound:anakinSound image:anakinPhoto];
        
        UIImage* palpatinePhoto = [UIImage imageNamed:@"palpatine.jpg"];
        NSData* palpatineSound = [NSData dataWithContentsOfURL:
                                  [[NSBundle mainBundle] URLForResource:@"palpatine"
                                                          withExtension:@".caf"]];
        NSURL* palpatineWiki = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Palpatine"];
        AMEHCharacter *palpatine = [[AMEHCharacter alloc] initWithFirstName:@"palpatine" lastName:@"" alias:@"Emperador" wiki:palpatineWiki sound:palpatineSound image:palpatinePhoto];
        
        UIImage* yodaPhoto = [UIImage imageNamed:@"yoda.jpg"];
        NSData* yodaSound = [NSData dataWithContentsOfURL:
                             [[NSBundle mainBundle] URLForResource:@"yoda"
                                                     withExtension:@".caf"]];
        NSURL* yodaWiki = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Yoda"];
        AMEHCharacter *yoda = [[AMEHCharacter alloc] initWithFirstName:@"Yoda" lastName:@"Milch" alias:@"Maestro Yoda" wiki:yodaWiki sound:yodaSound image:yodaPhoto];
        
        UIImage* r2D2Photo = [UIImage imageNamed:@"r2D2.jpg"];
        NSData* r2D2Sound = [NSData dataWithContentsOfURL:
                             [[NSBundle mainBundle] URLForResource:@"R2D2a"
                                                     withExtension:@".wav"]];
        NSURL* r2D2Wiki = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/r2D2"];
        AMEHCharacter *r2D2 = [[AMEHCharacter alloc] initWithAlias:@"R2 D2" wiki:r2D2Wiki sound:r2D2Sound image:r2D2Photo];
        
        
        UIImage* c3poPhoto = [UIImage imageNamed:@"c3po.png"];
        NSData* c3poSound = [NSData dataWithContentsOfURL:
                             [[NSBundle mainBundle] URLForResource:@"c3po"
                                                     withExtension:@".caf"]];
        NSURL* c3poWiki = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/c3po"];
        AMEHCharacter *c3PO = [[AMEHCharacter alloc] initWithAlias:@"C3 PO" wiki:c3poWiki sound:c3poSound image:c3poPhoto];
        
        self.imperialCharacters = @[anakin, palpatine];
        self.rebelCharacters = @[chewie, yoda, r2D2, c3PO];
        
    }
    return self;
}

-(int) imperialCount {
    // When building 32-bit applications, NSUInteger is a 32-bit unsigned integer.
    // A 64-bit application treats NSUInteger as a 64-bit unsigned integer.
    return (int)[self.imperialCharacters count];
}

-(int) rebelCount {
    // When building 32-bit applications, NSUInteger is a 32-bit unsigned integer.
    // A 64-bit application treats NSUInteger as a 64-bit unsigned integer.
    return (int)[self.rebelCharacters count];
}

-(AMEHCharacter*) imperialCharacterAtIndex:(int)index {
    return [self.imperialCharacters objectAtIndex: index];
}

-(AMEHCharacter*) rebelCharacterAtIndex:(int)index {
    return [self.rebelCharacters objectAtIndex: index];
}
@end
