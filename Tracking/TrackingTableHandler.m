//
//  TrackingTableHandler.m
//  Tracking
//
//  Created by Simon Goudie on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackingTableHandler.h"

@implementation TrackingTableHandler

@synthesize tableViewArray,myTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"SecondViewLoaded");
    [self loadArray];
}

- (void)loadArray
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSArray *array = [[NSArray alloc] initWithArray: [[appDelegate foodHandler] foodList]];
    self.tableViewArray = array;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableViewArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableIdentifier"];
    //    if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SimpleTableIdentifier"];
    //    }
    cell.textLabel.text = [[tableViewArray objectAtIndex:indexPath.row] food];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"You tapped %@",[[tableViewArray objectAtIndex:indexPath.row] food]);
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"View Appeared");
    //    [tableView reloadData];
    [self reloadInputViews];
}

@end