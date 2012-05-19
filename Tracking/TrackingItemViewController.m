//
//  TrackingItemViewController.m
//  Tracking
//
//  Created by Simon Goudie on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackingItemViewController.h"

@implementation TrackingItemViewController
@synthesize passedFood = _passedFood;
@synthesize foodNameLabel = _foodNameLabel;
@synthesize dateAddedLabel = _dateAddedLabel;
@synthesize star1 = _star1;
@synthesize star2 = _star2;
@synthesize star3 = _star3;
@synthesize star4 = _star4;
@synthesize star5 = _star5;

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
    TrackingFood *food = [self passedFood];
//show correct food name
    [self foodNameLabel].text = [NSString stringWithFormat:@"%@",food.food];
//show date added in field
    NSDateFormatter *formattedDate = [[NSDateFormatter alloc] init];
    [formattedDate setDateFormat:@"dd MMM yyyy"];
    [self dateAddedLabel].text = [NSString stringWithFormat:@"%@", [formattedDate stringFromDate:food.date]];
//show correct number of stars on load
    if(self.passedFood.rating > 0)
        [self.star1 setSelected:YES];
    if(self.passedFood.rating > 1)
        [self.star2 setSelected:YES];
    if(self.passedFood.rating > 2)
        [self.star3 setSelected:YES];
    if(self.passedFood.rating > 3)
        [self.star4 setSelected:YES];
    if(self.passedFood.rating > 4)
        [self.star5 setSelected:YES];
}

- (void)viewDidUnload
{
    [self setFoodNameLabel:nil];
    [self setStar1:nil];
    [self setStar2:nil];
    [self setStar3:nil];
    [self setStar4:nil];
    [self setStar5:nil];
    [self setDateAddedLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//set rating by touching stars, update lit up stars
//there has to be an nicer way of doing this...
//TODO: come back and turn this into a loop or switch
- (IBAction)rateOne:(id)sender 
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [self.passedFood setRating:1];
    [[appDelegate foodHandler] saveFoodList];
    [[self star1] setSelected:YES];
    [[self star2] setSelected:NO];
    [[self star3] setSelected:NO];
    [[self star4] setSelected:NO];
    [[self star5] setSelected:NO];
    [self.passedFood setReminded:YES];
}

- (IBAction)rateTwo:(id)sender 
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [self.passedFood setRating:2];
    [[appDelegate foodHandler] saveFoodList];
    [[self star1] setSelected:YES];
    [[self star2] setSelected:YES];
    [[self star3] setSelected:NO];
    [[self star4] setSelected:NO];
    [[self star5] setSelected:NO];
    [self.passedFood setReminded:YES];
}

- (IBAction)rateThree:(id)sender
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [self.passedFood setRating:3];
    [[appDelegate foodHandler] saveFoodList];
    [[self star1] setSelected:YES];
    [[self star2] setSelected:YES];
    [[self star3] setSelected:YES];
    [[self star4] setSelected:NO];
    [[self star5] setSelected:NO];
    [self.passedFood setReminded:YES];
}

- (IBAction)rateFour:(id)sender 
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [self.passedFood setRating:4];
    [[appDelegate foodHandler] saveFoodList];
    [[self star1] setSelected:YES];
    [[self star2] setSelected:YES];
    [[self star3] setSelected:YES];
    [[self star4] setSelected:YES];
    [[self star5] setSelected:NO];
    [self.passedFood setReminded:YES];
}

- (IBAction)rateFive:(id)sender 
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [self.passedFood setRating:5];
    [[appDelegate foodHandler] saveFoodList];
    [[self star1] setSelected:YES];
    [[self star2] setSelected:YES];
    [[self star3] setSelected:YES];
    [[self star4] setSelected:YES];
    [[self star5] setSelected:YES];
    [self.passedFood setReminded:YES];
}

@end
