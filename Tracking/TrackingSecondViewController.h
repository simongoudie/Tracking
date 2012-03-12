//
//  TrackingSecondViewController.h
//  Tracking
//
//  Created by Simon Goudie on 11/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackingFoodHandler.h"
#import "TrackingTableHandler.h"
#import "TrackingFoodHandler.h"
#import "TrackingAppDelegate.h"
#import "TrackingTableHandler.h"

@interface TrackingSecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
    NSArray* tableViewArray;
    
}

@property NSArray* tableViewArray;

- (void) loadArray;

@end
