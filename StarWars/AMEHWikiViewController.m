//
//  AMEHWikiViewController.m
//  StarWars
//
//  Created by Antonio Martin on 23/03/13.
//  Copyright (c) 2013 Antonio Martin. All rights reserved.
//

#import "AMEHWikiViewController.h"
#import "AMEHCharactersViewController.h"

@interface AMEHWikiViewController ()


@end

@implementation AMEHWikiViewController

- (id)initWithCharacter:(AMEHCharacter *)character
{
    self = [super init];
    if (self) {
        self.model = character;
        self.title = @"WikiPedia";
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
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    self.browser.delegate=self;
    [self updateBrowser];
    
    //Alta en las notificaciones
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(characterDidChange:)
                   name:CHARACTER_NOTIFICATION_NAME
                 object:nil];
    
}


- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSNotificationCenter *center= [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
    
}

- (void) updateBrowser {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.model.wiki];
    [self.browser loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIWebViewDelegate methods

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked || navigationType == UIWebViewNavigationTypeFormSubmitted) {
        return NO;
    } else {
        return YES;
    }
}

-(void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.loadingView stopAnimating];
}

-(void) webViewDidStartLoad:(UIWebView *)webView {
    [self.loadingView startAnimating];
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self.loadingView stopAnimating];
}

-(void) characterDidChange: (NSNotification *) notificaciont {

    //Sacar el diccionario
    NSDictionary *dict = notificaciont.userInfo;
    
    //Pillar el personaje
    AMEHCharacter *character = [dict objectForKey:CHARACTER_KEY];

    self.model = character;
    
    //Actualizar el modelo
    [self updateBrowser];
}


@end
