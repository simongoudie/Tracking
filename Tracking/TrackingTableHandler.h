//
//  TrackingTableHandler.h
//  Tracking
//
//  Created by Simon Goudie on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TrackingFoodHandler.h"
#import "TrackingTableHandler.h"
#import "TrackingFoodHandler.h"
#import "TrackingAppDelegate.h"

@interface TrackingTableHandler : UITableViewController <UITableViewDelegate,UITableViewDataSource> {
    
    NSArray* tableViewArray;
    UITableView* myTableView;
    
}

@property NSArray* tableViewArray;
@property (nonatomic) UITableView* myTableView;

- (void) loadArray;

@end