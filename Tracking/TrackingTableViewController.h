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
#import "TrackingItemViewController.h"
#import "TrackingFoodHandler.h"

@interface TrackingTableViewController : UITableViewController
{
    NSMutableArray* tableViewArray;
    IBOutlet UITableView  *MyTableView;
}

@property NSMutableArray *tableViewArray;
@property IBOutlet UITableView  *MyTableView;
@property NSInteger numberOfRows;

- (void) loadArray;

@end
