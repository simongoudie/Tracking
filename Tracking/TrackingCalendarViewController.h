//
//  TrackingCalendarViewController.h
//  Tracking
//
//  Created by Simon Goudie on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TapkuLibrary/TapkuLibrary.h>
#import "TrackingFoodHandler.h"
#import "TrackingAppDelegate.h"

@interface TrackingCalendarViewController : TKCalendarMonthTableViewController {
	NSMutableArray *dataArray, *data; 
	NSMutableDictionary *dataDictionary;
}

@property (retain,nonatomic) NSMutableArray *dataArray, *data;
@property (retain,nonatomic) NSMutableDictionary *dataDictionary;

- (void) generateDataForStartDate:(NSDate*)start endDate:(NSDate*)end;

@end