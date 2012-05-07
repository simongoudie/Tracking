//
//  TrackingTableViewController.m
//  Tracking
//
//  Created by Simon Goudie on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackingTableViewController.h"

@interface TrackingTableViewController ()

@end

@implementation TrackingTableViewController

@synthesize tableViewArray = _tableViewArray;
@synthesize MyTableView = _MyTableView;
@synthesize numberOfRows;

//Pulls in the array from food handler and stores it in tableViewArray
- (void)loadArray
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray: [[appDelegate foodHandler] foodList]];
    self.tableViewArray = array;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Sets up the array, numberOfRows and initial table view
- (void)viewDidLoad
{
    [self loadArray];
    [self.tableView reloadData];
    numberOfRows = [self.tableViewArray count];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

//Only one section in my table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

//Returns number of rows - probably don't really need numberOfRows...
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //    return [self.tableViewArray count];
    return numberOfRows;
}

//Fills in table cells by pulling food from tableViewArray, then setting text to food name
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:@"ReuseCell"];
	TrackingFood *food = [self.tableViewArray objectAtIndex:indexPath.row];
	cell.textLabel.text = food.food;
    NSDateFormatter *formattedDate = [[NSDateFormatter alloc] init];
    [formattedDate setDateFormat:@"HH:mm, dd MMM"];
    [cell detailTextLabel].text = [NSString stringWithFormat:@"Added at %@", [formattedDate stringFromDate:food.date]];
    return cell;
}

// This is to allow editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Method for what happens when editing table.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        numberOfRows--;
        TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        [[appDelegate foodHandler] removeFoodFromList:[indexPath indexAtPosition:1]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Supports food list reordering by removing then readding moved food
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    TrackingFood *tempFood = [[[appDelegate foodHandler] foodList] objectAtIndex: [fromIndexPath indexAtPosition:1]];
    [[appDelegate foodHandler] removeFoodFromList:[fromIndexPath indexAtPosition:1]];
    [[appDelegate foodHandler] addFoodToList:tempFood atPosition:[toIndexPath indexAtPosition:1]];
    [[appDelegate foodHandler] saveFoodList];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Table view delegate
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TrackingFood *theBall = [self.tableViewArray objectAtIndex:indexPath.row];
    // Navigation logic may go here. Create and push another view controller.
    TrackingItemViewController *itemViewController = [[TrackingItemViewController alloc] initWithNibName:@"ItemView" bundle:nil];
     // Pass the selected object to the new view controller.
    itemViewController.passedFood = theBall;
    NSLog(@"Item passed is called: %@",itemViewController.passedFood.food);
    [self.navigationController pushViewController:itemViewController animated:YES];
}
*/

//Some fancy thing I had to do to pass the selected food to the single food view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender
{
    if ([[segue identifier] isEqualToString:@"passedFood"]) {
        TrackingItemViewController *itemViewController = (TrackingItemViewController *)[segue destinationViewController];
        NSIndexPath *selectedIndexPath = [_MyTableView indexPathForSelectedRow];
        TrackingFood *theBall = [_tableViewArray objectAtIndex:selectedIndexPath.row];
        itemViewController.passedFood = theBall;
    }
}

//this reloads the array and reloads the table each time the view appears (fixes problems)
- (void)viewWillAppear:(BOOL)animated
{
    [self loadArray];
    [self.tableView reloadData];
    numberOfRows = [self.tableViewArray count];
}

@end
