//
//  TrackingFood.h
//  Tracking
//
//  Created by Simon Goudie on 11/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackingFood : NSObject

@property (strong) NSString *food;
@property (strong) NSString *reminder;
@property NSInteger *rating;
@property BOOL *reminded;

@end