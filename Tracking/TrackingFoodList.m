//
//  TrackingFoodList.m
//  Tracking
//
//  Created by Simon Goudie on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackingFoodList.h"

@implementation TrackingFoodList

@synthesize foodlist = _foodlist;

- (void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject: [self foodlist] forKey:@"foodlist"];
}

- (id) initWithCoder: (NSCoder *)coder
{
    if (self = [super init])
    {
        [self setFoodlist: [coder decodeObjectForKey:@"foodlist"]];
    }
    return self;
}

-(void) addFoodToList:(TrackingFood *)newFood
{
//WORKING HERE
    NSLog(@"list add start");
    NSLog(@"food to add is %@", newFood.food);
    [_foodlist addObject:newFood];
    //[_foodlist insertObject:newFood atIndex:[_foodlist count]];
    NSLog(@"The object at index 0 is %@", [[_foodlist objectAtIndex:0] food]);
    NSLog(@"list add finish");
    NSLog(@"List count is %d after adding",[_foodlist count]);

    //test food list
    NSLog(@"Food list is now: ");
    TrackingFood *fooditem;
    for (fooditem in _foodlist){
        NSLog(@"%@", fooditem.food);
    }
    //NSLog(@"List count is %d before saving",[foodlist count]);
    //[self saveFoodList];
    //NSLog(@"List count is %d after saving method",[foodlist count]);
}

@end
