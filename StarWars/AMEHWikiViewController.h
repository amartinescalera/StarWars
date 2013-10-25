//
//  AMEHWikiViewController.h
//  StarWars
//
//  Created by Antonio Martin on 23/03/13.
//  Copyright (c) 2013 Antonio Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMEHCharacter.h"

@interface AMEHWikiViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) AMEHCharacter* model;
@property (nonatomic, weak) IBOutlet UIWebView* browser;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView* loadingView;

-(id) initWithCharacter:(AMEHCharacter*) character;

@end
