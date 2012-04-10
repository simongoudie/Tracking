//
//  TrackingFoodList.h
//  Tracking
//
//  Created by Simon Goudie on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//  This is an array class that holds food objects. It is handled by FoodHandler


#import <Foundation/Foundation.h>
#import "TrackingFood.h"

@interface TrackingFoodList : NSObject <NSCoding>

@property NSMutableArray * foodlist;
-(void) addFoodToList:newFood;

@end
