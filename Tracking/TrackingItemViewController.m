//
//  TrackingItemViewController.m
//  Tracking
//
//  Created by Simon Goudie on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackingItemViewController.h"

@interface TrackingItemViewController ()

@end

@implementation TrackingItemViewController
@synthesize foodNameLabel = _foodNameLabel;
@synthesize dateAddedLabel = _dateAddedLabel;
@synthesize passedFood = _passedFood;
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
    if(_passedFood.rating > 0)
        [_star1 setSelected:YES];
    if(_passedFood.rating > 1)
        [_star2 setSelected:YES];
    if(_passedFood.rating > 2)
        [_star3 setSelected:YES];
    if(_passedFood.rating > 3)
        [_star4 setSelected:YES];
    if(_passedFood.rating > 4)
        [_star5 setSelected:YES];
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
- (IBAction)rateOne:(id)sender 
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [_passedFood setRating:1];
    [[appDelegate foodHandler] saveFoodList];
    [[self star1] setSelected:YES];
    [[self star2] setSelected:NO];
    [[self star3] setSelected:NO];
    [[self star4] setSelected:NO];
    [[self star5] setSelected:NO];
}

- (IBAction)rateTwo:(id)sender 
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [_passedFood setRating:2];
    [[appDelegate foodHandler] saveFoodList];
    [[self star1] setSelected:YES];
    [[self star2] setSelected:YES];
    [[self star3] setSelected:NO];
    [[self star4] setSelected:NO];
    [[self star5] setSelected:NO];
}

- (IBAction)rateThree:(id)sender
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [_passedFood setRating:3];
    [[appDelegate foodHandler] saveFoodList];
    [[self star1] setSelected:YES];
    [[self star2] setSelected:YES];
    [[self star3] setSelected:YES];
    [[self star4] setSelected:NO];
    [[self star5] setSelected:NO];
}

- (IBAction)rateFour:(id)sender 
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [_passedFood setRating:4];
    [[appDelegate foodHandler] saveFoodList];
    [[self star1] setSelected:YES];
    [[self star2] setSelected:YES];
    [[self star3] setSelected:YES];
    [[self star4] setSelected:YES];
    [[self star5] setSelected:NO];
}

- (IBAction)rateFive:(id)sender 
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [_passedFood setRating:5];
    [[appDelegate foodHandler] saveFoodList];
    [[self star1] setSelected:YES];
    [[self star2] setSelected:YES];
    [[self star3] setSelected:YES];
    [[self star4] setSelected:YES];
    [[self star5] setSelected:YES];
}

@end
