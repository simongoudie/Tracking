//
//  TrackingFoodHandler.m
//  Tracking
//
//  Created by Simon Goudie on 11/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackingFoodHandler.h"

@implementation TrackingFoodHandler

@synthesize foodList = _foodList;

- (void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject: [self foodList] forKey:@"foodList"];
}

- (id) initWithCoder: (NSCoder *)coder
{
    if (self = [super init])
    {
        [self setFoodList: [coder decodeObjectForKey:@"foodList"]];
    }
         return self;
}

- (NSString *) getPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"foodlistfile"];
}

- (void) setupList
{
    NSLog(@"Start Setup!");
    if(!_foodList){
        if([[NSFileManager defaultManager] fileExistsAtPath:[self getPath]]){
            NSLog(@"No list, file found, loading array");
            [self loadFoodList];
        } else {
            NSLog(@"No list, no file, creating array");
            _foodList = [[NSMutableArray alloc] init];
        }
    } else {
        NSLog(@"List found, no need to load or create");
    }
    NSLog(@"List count is %d after setup",[_foodList count]);
}

- (void) saveFoodList
{
    NSMutableArray * rootObject;
    rootObject = [NSMutableArray array];
    [rootObject setValue: _foodList forKey:@"foodList"];
    [NSKeyedArchiver archiveRootObject: _foodList toFile:[self getPath]];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:[self getPath]]){
        NSLog(@"File exists after saving");
    } else {
        NSLog(@"File does not exist after saving");
    }
/*
    [foodList writeToFile:filePath atomically:YES];
        NSLog(@"List count is %d after saving process",[foodList count]);
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        NSLog(@"File exists after saving");
    }
        NSLog(@"File does not exist after saving");
*/
}

- (void) loadFoodList
{
    if([[NSFileManager defaultManager] fileExistsAtPath:[self getPath]]){
        NSLog(@"File exists before loading");
        _foodList = [NSKeyedUnarchiver unarchiveObjectWithFile:[self getPath]];
//        _foodList = [[NSMutableArray alloc] initWithContentsOfFile:[self getPath]];
    } else {
        NSLog(@"No file found to load");
    }
}

-(void) addFoodToList:(TrackingFood *)newFood
{
    [_foodList addObject:newFood];

//    NSLog(@"The object at index 0 is %@", [[_foodList objectAtIndex:0] food]);
//    NSLog(@"List count is %d after adding",[_foodList count]);
    
/*    //test food list
    TrackingFood *fooditem;
    NSString *foodstring = @"";
    for (fooditem in _foodList){
        foodstring = [foodstring stringByAppendingString:fooditem.food];
        foodstring = [foodstring stringByAppendingString:@" "];
    }
    NSLog(@"Food list is now: %@", foodstring);
 */

    NSLog(@"List count is %d before saving",[_foodList count]);
    [self saveFoodList];
    NSLog(@"List count is %d after saving method",[_foodList count]);
}

@end