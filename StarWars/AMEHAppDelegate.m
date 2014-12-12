//
//  AMEHAppDelegate.m
//  StarWars
//
//  Created by Antonio Martin on 22/03/13.
//  Copyright (c) 2013 Antonio Martin. All rights reserved.
//

#import "AMEHAppDelegate.h"
#import "AMEHCharacter.h"
#import "AMEHCharacterViewController.h"
#import "AMEHWikiViewController.h"
#import "AMEHCharacters.h"
#import "AMEHCharactersViewController.h"

@implementation AMEHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.

//    AMEHCharactersViewController* charVC = [[AMEHCharactersViewController alloc] initWithStyle:UITableViewStylePlain];
//    self.window.rootViewController = charVC;
    
    //configuramos aspecto
    [self configureAppearance];
    
    //Creamos el modelo
    AMEHCharacters *model = [[AMEHCharacters alloc] init];

    //Configuro el tipo de pantalla
    UIDevice *device = [UIDevice currentDevice];
    
    if ([device userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        //Controlador dos controladores
        AMEHCharactersViewController *charsVC = [[AMEHCharactersViewController alloc] initWithModel: model
                                                                                              style:UITableViewStylePlain];
        
        AMEHCharacterViewController *charVC = [[AMEHCharacterViewController alloc] initWithCharacter: [self lastCharacterFromCharacters: model]];
        
        //Creamos un combinador
        UINavigationController *navChar = [[UINavigationController alloc] init];
        [navChar pushViewController:charVC animated:NO];
        
        UINavigationController *navTable = [[UINavigationController alloc] init];
        [navTable pushViewController:charsVC animated:NO];
        
        UISplitViewController *splitVC = [[UISplitViewController alloc] init];
        
        splitVC.viewControllers = @[navTable, navChar];
        
        //Asignamos Delegados
        splitVC.delegate = charVC;
        charsVC.delegate = charVC;
        
        self.window.rootViewController = splitVC;
    } else {
        
        //Teléfono
        
        //Creo el controlador
        AMEHCharactersViewController *charsVC = [[AMEHCharactersViewController alloc] initWithModel:model style:UITableViewStylePlain];
        
        //Creo un navigation
        UINavigationController *charNav = [[UINavigationController alloc] init];
        [charNav pushViewController:charsVC
                           animated:NO];
        
        charsVC.delegate = charsVC;
        
        self.window.rootViewController = charNav;
        
    }
    
    
    
    
    self.window.backgroundColor = [UIColor blueColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(UINavigationController *) createNavigationController:(AMEHCharacterViewController *) vc {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.tintColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2];
    return nav;
}

#pragma mark -Utils

-(void) configureAppearance {
    [[UINavigationBar appearance] setTintColor:[UIColor
                                  colorWithRed:0
                                         green:0
                                          blue:0.11
                                         alpha:1]];
    
    [[UITableViewHeaderFooterView appearance] setTintColor:[UIColor
                                                colorWithRed:0
                                                green:0
                                                blue:0.22
                                                alpha:1]];
    
    [[UIToolbar appearance] setTintColor:[UIColor
                                         colorWithRed:0
                                         green:0
                                         blue:0.22
                                         alpha:1]];
}

-(AMEHCharacter *) lastCharacterFromCharacters: (AMEHCharacters *) characters {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *coords = [defaults objectForKey:LAST_CHARACTER_KEY];
    
    // When building 32-bit applications, NSUInteger is a 32-bit unsigned integer.
    // A 64-bit application treats NSUInteger as a 64-bit unsigned integer.
    int section = (int)[[coords objectForKey:SECTION_KEY] integerValue];
    int row = (int)[[coords objectForKey:ROW_KEY] integerValue];
    
    AMEHCharacter *character = nil;
    
    if (section == 0) {
        character = [characters rebelCharacterAtIndex:row];
    } else {
        character = [characters imperialCharacterAtIndex:row];
    }
    
    return character;
    
}


-(void) setDefaultCharacter {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:LAST_CHARACTER_KEY] == nil) {
        //No hay nada y lo metemos
        NSDictionary *coords = @{SECTION_KEY: @0, ROW_KEY: @0};
        [defaults setObject:coords
                     forKey:LAST_CHARACTER_KEY];
        
        [defaults synchronize];
    }
    
}





























@end
