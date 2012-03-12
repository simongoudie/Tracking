//
//  TrackingAppDelegate.h
//  Tracking
//
//  Created by Simon Goudie on 11/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackingFoodHandler.h"
#import "TrackingFood.h"
#import "TrackingTableViewController.h"

@interface TrackingAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TrackingFoodHandler *foodHandler;

- (void) addFoodToList:(TrackingFood *)foodToAdd;
- (void) printFoodList;

@end
