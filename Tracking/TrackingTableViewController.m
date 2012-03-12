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

@synthesize tableViewArray,MyTableView;

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

- (void)viewDidLoad
{
    [self loadArray];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tableViewArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:@"ReuseCell"];
	TrackingFood *food = [self.tableViewArray objectAtIndex:indexPath.row];
	cell.textLabel.text = food.food;
	cell.detailTextLabel.text = food.reminder;
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender
{
    if ([[segue identifier] isEqualToString:@"passedFood"]) {
        
        TrackingItemViewController *itemViewController = (TrackingItemViewController *)[segue destinationViewController];
        
        NSIndexPath *selectedIndexPath = [self.MyTableView indexPathForSelectedRow];
        TrackingFood *theBall = [tableViewArray objectAtIndex:selectedIndexPath.row];
        NSLog(@"theBall = %@", theBall.food);
        itemViewController.passedFood = theBall;
        NSLog(@"Pass complete");
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    //    [tableView reloadData];
    [self loadArray];
    [self.tableView reloadData];
}

@end
