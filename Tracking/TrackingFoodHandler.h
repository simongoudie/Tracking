//
//  TrackingFoodHandler.h
//  Tracking
//
//  Created by Simon Goudie on 11/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrackingFood.h"

@interface TrackingFoodHandler : NSObject

@property NSMutableArray *foodList;

-(void) addFoodToList:(TrackingFood*)newFood;
-(void) printFoodList;

@end
