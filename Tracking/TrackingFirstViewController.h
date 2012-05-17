//
//  TrackingFirstViewController.h
//  Tracking
//
//  Created by Simon Goudie on 11/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackingFood.h"
#import "TrackingFoodHandler.h"
#import "TrackingAppDelegate.h"

@interface TrackingFirstViewController : UIViewController{
    IBOutlet UITextField *foodNameInput;
}

@property (weak, nonatomic) IBOutlet UITextField *foodNameInput;

- (IBAction)PushButton:(id)sender;

@end
