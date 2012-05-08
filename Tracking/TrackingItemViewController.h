//
//  TrackingItemViewController.h
//  Tracking
//
//  Created by Simon Goudie on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackingAppDelegate.h"
#import "TrackingTableViewController.h"

@interface TrackingItemViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *dateAddedLabel;
@property TrackingFood *passedFood;
@property (weak, nonatomic) IBOutlet UILabel *foodNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;

- (IBAction)rateOne:(id)sender;
- (IBAction)rateTwo:(id)sender;
- (IBAction)rateThree:(id)sender;
- (IBAction)rateFour:(id)sender;
- (IBAction)rateFive:(id)sender;

@end