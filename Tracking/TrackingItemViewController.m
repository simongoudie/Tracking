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
@synthesize foodRatingLabel = _foodRatingLabel;
@synthesize passedFood = _passedFood;

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
	// Do any additional setup after loading the view.
    TrackingFood *food = [self passedFood];
    [self foodNameLabel].text = [NSString stringWithFormat:@"%@",food.food];
    [self foodRatingLabel].text = [NSString stringWithFormat:@"%d",food.rating];
    NSLog(@"Item received is called: %@",[self passedFood].food);
}

- (void)viewDidUnload
{
    [self setFoodNameLabel:nil];
    [self setFoodRatingLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
