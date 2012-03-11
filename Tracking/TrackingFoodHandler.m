//
//  TrackingFoodHandler.m
//  Tracking
//
//  Created by Simon Goudie on 11/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackingFoodHandler.h"

@implementation TrackingFoodHandler

@synthesize foodList;

- (void) addFoodToList:(TrackingFood *)newFood
{
    if (!foodList){
        foodList = [[NSMutableArray alloc] init];
    }
    [foodList insertObject:newFood atIndex:[foodList count]];
}

- (void) printFoodList
{
    NSUInteger i;
    for (i = 0; i < [foodList count]; i++){
        NSLog(@"Food %d is %@ and rem is %@",i,[[foodList objectAtIndex:i] food], [[foodList objectAtIndex:i] reminder]);
    }
}

@end