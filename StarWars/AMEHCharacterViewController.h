//
//  AMEHCharacterViewController.h
//  StarWars
//
//  Created by Antonio Martin on 23/03/13.
//  Copyright (c) 2013 Antonio Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMEHCharacter.h"
#import "CafPlayer.h"
#import "AMEHCharactersViewController.h"

@interface AMEHCharacterViewController : UIViewController <UISplitViewControllerDelegate, AMEHCharactersViewControllerDelegate>

@property (nonatomic, strong) AMEHCharacter* model;
@property (nonatomic, weak) IBOutlet UIImageView* photo;
@property (nonatomic, strong) IBOutlet CafPlayer* player;

-(id) initWithCharacter:(AMEHCharacter*) character;
-(IBAction)playSound:(id)sender;
-(IBAction)goToWiki:(id)sender;


@end
