//
//  TrackingFoodHandler.h
//  Tracking
//
//  Created by Simon Goudie on 11/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrackingFood.h"

@interface TrackingFoodHandler : NSObject <NSCoding>{
    NSMutableSet *foodlist;
    NSInteger unratedCount;
}

@property NSMutableArray *foodList;
@property NSInteger unratedCount;

- (NSString *) getPath;
- (void) saveFoodList;
- (void) loadFoodList;
- (void) setupList;
- (void) addFoodToList:(TrackingFood *)newFood;
- (void) removeFoodFromList:(NSInteger)indexToRemove;
- (void) listFoods;
- (void) addFoodToList:(TrackingFood *)newFood atPosition:(NSInteger)position;

@end
