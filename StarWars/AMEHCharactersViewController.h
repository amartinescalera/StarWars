//
//  AMEHCharactersViewController.h
//  StarWars
//
//  Created by Antonio Martin on 23/03/13.
//  Copyright (c) 2013 Antonio Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMEHCharacter.h"

#define REBEL_SECTION 0
#define IMPERIAL_SECTION 1

#define CHARACTER_NOTIFICATION_NAME @"didSelectCharacter"
#define CHARACTER_KEY @"character"

@class AMEHCharactersViewController;
@class AMEHCharacters;

@protocol AMEHCharactersViewControllerDelegate <NSObject>

-(void) charactersViewController: (AMEHCharactersViewController *) charsVC
              didSelectCharacter: (AMEHCharacter *) character;

@end

@interface AMEHCharactersViewController : UITableViewController<AMEHCharactersViewControllerDelegate>

@property (nonatomic, weak) id<AMEHCharactersViewControllerDelegate> delegate;

- (id) initWithModel: (AMEHCharacters *)aModel
               style:(UITableViewStyle) aStyle;

@end
