//
//  TrackingFood.m
//  Tracking
//
//  Created by Simon Goudie on 11/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackingFood.h"

@implementation TrackingFood

@synthesize food = _food;
@synthesize rating = _rating;
@synthesize reminded = _reminded;

//foods include encoding methods so they can be archived to disc in the list
-(void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject: [self food] forKey:@"food"];
//    [coder encodeBool: *(reminded) forKey:@"reminded"];
//    [coder encodeInt: *(rating) forKey:@"rating"];
}

-(id) initWithCoder: (NSCoder *)coder
{
    if(self = [super init])
    {
        [self setFood: [coder decodeObjectForKey:@"food"]];
//        [self setReminded: (signed char *)[coder decodeBoolForKey:@"reminded"]];
//        [self setRating: (NSInteger *)[coder decodeIntForKey:@"rating"]];
    }
    return self;
}

@end