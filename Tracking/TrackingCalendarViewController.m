//
//  TrackingCalendarViewController.m
//  Tracking
//
//  Created by Simon Goudie on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackingCalendarViewController.h"

@implementation TrackingCalendarViewController

@synthesize dataArray, dataDictionary, data;
 
 
 - (void) viewDidLoad{
 [super viewDidLoad];
 [self.monthView selectDate:[NSDate date]];
 }

 - (void) viewDidAppear:(BOOL)animated{
 [super viewDidAppear:animated];
 }

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
 
 - (NSArray*) calendarMonthView:(TKCalendarMonthView*)monthView marksFromDate:(NSDate*)startDate toDate:(NSDate*)lastDate{
    [self generateDataForStartDate:startDate endDate:lastDate];
//     NSLog(@"%@", dataArray);
    return dataArray;
 }

 - (void) calendarMonthView:(TKCalendarMonthView*)monthView didSelectDate:(NSDate*)date{ 
 // CHANGE THE DATE TO YOUR TIMEZONE
 //TKDateInformation info = [date dateInformationWithTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
 //NSDate *myTimeZoneDay = [NSDate dateFromDateInformation:info timeZone:[NSTimeZone systemTimeZone]];
 //NSLog(@"Date Selected: %@",myTimeZoneDay);
 
 [self.tableView reloadData];
 }

 - (void) calendarMonthView:(TKCalendarMonthView*)mv monthDidChange:(NSDate*)d animated:(BOOL)animated{
 [super calendarMonthView:mv monthDidChange:d animated:animated];
 [self.tableView reloadData];
 }
  
 - (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
 return 1;
 }

 - (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {	
 NSArray *ar = [dataDictionary objectForKey:[self.monthView dateSelected]];
 if(ar == nil) return 0;
 return [ar count];
 }

 - (UITableViewCell *) tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath { 
 static NSString *CellIdentifier = @"Cell";
 UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:CellIdentifier];
 if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
     
 NSArray *ar = [dataDictionary objectForKey:[self.monthView dateSelected]];
 cell.textLabel.text = [[ar objectAtIndex:indexPath.row] food];
 
 return cell;
 
 }

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"passedFood" sender:self];
}
 
- (void) generateDataForStartDate:(NSDate*)startDate endDate:(NSDate*)end{
    NSLog(@"Delegate Range: %@ %@ %d",startDate,end,[startDate daysBetweenDate:end]);
         
    self.dataArray = [NSMutableArray array];
    self.dataDictionary = [NSMutableDictionary dictionary];
    self.data = [NSMutableArray array];
    
    // Initialise calendar to current type and set the timezone to never have daylight saving
	NSCalendar *cal = [NSCalendar currentCalendar];
	[cal setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
	
	// Construct DateComponents based on startDate so the iterating date can be created.
	// Its massively important to do this assigning via the NSCalendar and NSDateComponents because of daylight saving has been removed 
	// with the timezone that was set above. If you just used "startDate" directly (ie, NSDate *date = startDate;) as the first 
	// iterating date then times would go up and down based on daylight savings.
    //	NSDateComponents *comp = [cal components:(NSMonthCalendarUnit | NSMinuteCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSSecondCalendarUnit) fromDate:startDate];
    NSDateComponents *compShort = [cal components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit) fromDate:startDate];
	NSDate *d = [cal dateFromComponents:compShort];
    
    // Setup link to tracking items
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSMutableArray *foodlist = [[NSMutableArray alloc] initWithArray: [[appDelegate foodHandler] foodList]];
    
    //Fill data array
    for(int i = 0; i < [foodlist count]; i++){
        NSDateComponents *compShort2 = [cal components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit) fromDate:[[foodlist objectAtIndex:i] date]];
        NSDate *finalDate = [cal dateFromComponents:compShort2];
        [self.data addObject:finalDate];
    }
	
	// Init offset components to increment days in the loop by one each time
	NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
	[offsetComponents setDay:1];
    
    // for each date between start date and end date check if they exist in the data array
	while (YES) {
		// Is the date beyond the last date? If so, exit the loop.
		// NSOrderedDescending = the left value is greater than the right
		if ([d compare:end] == NSOrderedDescending) {
			break;
		}
		
		// If the date is in the data array, add it to the marks array, else don't
        
        // Quick test of all dates agains data[0]
//        NSLog(@"%@ compared to %@", [d description], [[self.data objectAtIndex:0] description]);
//        if ([d compare:[self.data objectAtIndex:0]] == NSOrderedSame)
//            NSLog(@"MATCH MATCH MATCH!!!!");
//        else NSLog(@"NO MATCH");
        
//      d is the day being queried
//      dataDictionary needs to contain a set of arrays containing the name of each item from d
//      ie. dataDictionary[d] = [item 1, item 2, nil]
//      dataArray needs to contain a series of bools, with YES recorded if d has items
        
		if ([self.data containsObject:d]) {
            NSMutableArray *tempDict = [[NSMutableArray alloc] init];
            for (int k = 0; k < [foodlist count]; k++){
                NSDateComponents *compShort3 = [cal components:(NSMonthCalendarUnit | NSYearCalendarUnit | NSDayCalendarUnit) fromDate:[[foodlist objectAtIndex:k] date]];
                NSDate *checkDate = [cal dateFromComponents:compShort3];
                if ([d compare:checkDate] == NSOrderedSame){
                    [tempDict addObject:[foodlist objectAtIndex:k]];
                }
            }
            [dataDictionary setObject:[[NSArray alloc] initWithArray:tempDict] forKey:d];
			[dataArray addObject:[NSNumber numberWithBool:YES]];
		} else 
            [dataArray addObject:[NSNumber numberWithBool:NO]];
		
		// Increment day using offset components (ie, 1 day in this instance)
		d = [cal dateByAddingComponents:offsetComponents toDate:d options:0];
	}

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender
{
    if ([[segue identifier] isEqualToString:@"passedFood"]) {
        TrackingItemViewController *itemViewController = (TrackingItemViewController *)[segue destinationViewController];
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        TrackingFood *theBall = [[dataDictionary objectForKey:[self.monthView dateSelected]] objectAtIndex:selectedIndexPath.row];
        itemViewController.passedFood = theBall;
    }
}

      
@end