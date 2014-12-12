//
//  AMEHCharactersViewController.m
//  StarWars
//
//  Created by Antonio Martin on 23/03/13.
//  Copyright (c) 2013 Antonio Martin. All rights reserved.
//

#import "AMEHCharactersViewController.h"
#import "AMEHCharacters.h"
#import "AMEHCharacterViewController.h"

@interface AMEHCharactersViewController ()

@property (nonatomic, strong) AMEHCharacters* model;

@end

@implementation AMEHCharactersViewController

- (id) initWithModel: (AMEHCharacters *)aModel
               style:(UITableViewStyle) aStyle;
{
    if (self = [super initWithStyle:aStyle]) {
        // Custom initialization
        _model = aModel;
        self.title = @"Star Wars Encyclopedia";

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Averiguamos de que sección me esta hablando.
    if (section == REBEL_SECTION) {
        return [self.model rebelCount];
        //return @"Rebels";
    } else {
        return [self.model imperialCount];
        //return @"Imperials";
    }
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == REBEL_SECTION) {
        return @"Rebels";
    } else {
        return @"Imperials";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Averiguamos de que personaje se trata
    AMEHCharacter *character = nil;
    
    // When building 32-bit applications, NSUInteger is a 32-bit unsigned integer.
    // A 64-bit application treats NSUInteger as a 64-bit unsigned integer.
    int index = (int) indexPath.row;
    
    if (indexPath.section == REBEL_SECTION) {
        character = [self.model rebelCharacterAtIndex:index];
    } else {
         character = [self.model imperialCharacterAtIndex:index];
    }
    
    //Creamos la Celda
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    //Hay que sincronizar los datos entre el modelo (el personaje) y la vista (celda)
    cell.imageView.image = character.image;
    cell.textLabel.text = character.alias;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", character.firstName, character.lastName];
    //cell.textLabel.text =  [NSString stringWithFormat:@"Fila %d de la sección %d", indexPath.row, indexPath.section];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     //<#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    //Averiguamos el personaje
    //Creamos un modelo
    
    // When building 32-bit applications, NSUInteger is a 32-bit unsigned integer.
    // A 64-bit application treats NSUInteger as a 64-bit unsigned integer.
    int index = (int) indexPath.row;
    
    AMEHCharacter *character = nil;
    if (indexPath.section == REBEL_SECTION) {
        character = [self.model rebelCharacterAtIndex:index];
    } else {
        character = [self.model imperialCharacterAtIndex:index];
    }
    
    //Avisamos a nuestro delegado
    [self.delegate charactersViewController:self
                         didSelectCharacter:character];
    
    
    //Además mando una notificación
    NSNotification *notification = [NSNotification notificationWithName: CHARACTER_NOTIFICATION_NAME
                                                                 object:self
                                                                userInfo:@{CHARACTER_KEY: character}];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    //y encima, guardo el último
    [self  saveLastCharacterForIndexPath: indexPath];
    
}

-(void) saveLastCharacterForIndexPath: (NSIndexPath *) indexPath {

    //Creo un dictionary con las coordenadas.
    NSDictionary *coords = @{SECTION_KEY: @(indexPath.section),
                             ROW_KEY: @(indexPath.row)};
                             
    
    NSUserDefaults *defualts =[NSUserDefaults standardUserDefaults];
    [defualts setObject:coords forKey:LAST_CHARACTER_KEY];
                             
    //Guardamos
    [defualts synchronize];
    
}


#pragma mark -table AMEHCharactersViewControllerDelegate

- (void) charactersViewController:(AMEHCharactersViewController *)charsVC didSelectCharacter:(AMEHCharacter *)character {
    
    AMEHCharacterViewController *charVC = [[AMEHCharacterViewController alloc] initWithCharacter:character];
    
    //Hacemos el push
    [self.navigationController pushViewController:charVC animated:YES];
    
    
}





@end
