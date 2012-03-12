//
//  TrackingItemViewController.h
//  Tracking
//
//  Created by Simon Goudie on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackingAppDelegate.h"

@interface TrackingItemViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *foodNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodReminderLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodRatingLabel;
@property TrackingFood *passedFood;

@end
