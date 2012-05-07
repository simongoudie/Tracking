//
//  TrackingFirstViewController.m
//  Tracking
//
//  Created by Simon Goudie on 11/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackingFirstViewController.h"

@interface TrackingFirstViewController ()

@end

@implementation TrackingFirstViewController

@synthesize foodNameInput = _foodNameInput;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setFoodNameInput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//Method called when the add button is pushed on first screen
- (IBAction)PushButton:(id)sender
{
    TrackingAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate]; //link appdel
    TrackingFood *food1 = [[TrackingFood alloc]init]; //create new TrackingFood "food1"
    [food1 setFood:[self foodNameInput].text]; //set food1's name property
    [food1 setReminded:NO]; //set food1's reminded field
    [food1 setRating:0]; //set default food1's rating to 0
    [food1 setDate:[NSDate date]];
    [[appDelegate foodHandler] addFoodToList:food1];
    [self foodNameInput].text = nil; //reset input text box
    [[self foodNameInput] resignFirstResponder];
}

@end
