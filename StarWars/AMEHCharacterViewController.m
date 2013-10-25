//
//  AMEHCharacterViewController.m
//  StarWars
//
//  Created by Antonio Martin on 23/03/13.
//  Copyright (c) 2013 Antonio Martin. All rights reserved.
//

#import "AMEHCharacterViewController.h"
#import "CafPlayer.h"
#import "AMEHWikiViewController.h"

@interface AMEHCharacterViewController ()

//@property (nonatomic, weak) IBOutlet CafPlayer* player;

@end

@implementation AMEHCharacterViewController

- (id)initWithCharacter:(AMEHCharacter *)character
{
    self = [super init];
    if (self) {
        self.model = character;
        self.player = [[CafPlayer alloc] init];
        self.title = self.model.alias;
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.photo.image = self.model.image;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)playSound:(id)sender {
    NSLog(@"Me han pulsado!!!");
    [self.player playSoundData:self.model.sound];

}

-(IBAction)goToWiki:(id)sender {
    AMEHWikiViewController *wikiVC = [[AMEHWikiViewController alloc] initWithCharacter:self.model];
    [self.navigationController pushViewController:wikiVC animated:YES];
}

#pragma mark -UISplitViewControllerDelegate
-(void) splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc {
    
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
}

-(void) splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    self.navigationItem.leftBarButtonItem = nil;
    
}

#pragma mark -AMEHCharactersViewController.h

-(void) charactersViewController:(AMEHCharactersViewController *) charsVC
              didSelectCharacter:(AMEHCharacter *)character
{
                  
    //Ha cambiado nuestro modelo.
    self.model = character;
    self.photo.image = self.model.image;
    self.title = self.model.alias;
    
    //[self.navigationController popToRootViewControllerAnimated:YES];

}

@end
