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
@synthesize date = _date;
@synthesize localNotif = _localNotif;

//foods include encoding methods so they can be archived to disc in the list
-(void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject: [self food] forKey:@"food"];
//    [coder encodeBool: *(reminded) forKey:@"reminded"];
    [coder encodeInt: _rating forKey:@"rating"];
    [coder encodeObject: [self date] forKey:@"date"];
}

-(id) initWithCoder: (NSCoder *)coder
{
    if(self = [super init])
    {
        [self setFood: [coder decodeObjectForKey:@"food"]];
//        [self setReminded: (signed char *)[coder decodeBoolForKey:@"reminded"]];
        [self setRating: [coder decodeIntForKey:@"rating"]];
        [self setDate: [coder decodeObjectForKey:@"date"]];
    }
    return self;
}

//sets up a local notification to be fired after food is created
-(void) setupLocalNotification
{
    UILocalNotification *localnotification = [[UILocalNotification alloc] init];
    if (localnotification == nil)
        return;
    localnotification.fireDate = [[NSDate date] dateByAddingTimeInterval:60];
    localnotification.timeZone = [NSTimeZone defaultTimeZone];
    localnotification.alertBody = [NSString stringWithFormat:@"Remember to rate %@",self.food];
    localnotification.alertAction = [NSString stringWithFormat:@"Rate now"];
    localnotification.soundName = UILocalNotificationDefaultSoundName;
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:self.food forKey:@"food"];
    localnotification.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localnotification];
    self.localNotif = localnotification;
}

@end