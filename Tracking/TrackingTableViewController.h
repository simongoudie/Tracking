//
//  TrackingTableViewController.h
//  Tracking
//
//  Created by Simon Goudie on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackingAppDelegate.h"
#import "TrackingFood.h"


@interface TrackingTableViewController : UITableViewController
{
    NSMutableArray* tableViewArray;
}

@property NSMutableArray *tableViewArray;

- (void) loadArray;

@end
