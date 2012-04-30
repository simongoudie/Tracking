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


//Encoding methods to save the list to disc
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


//Methods for setting up, loading and saving a foodlist
- (NSString *) getPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"foodlistfile"];
}

- (void) setupList
{
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
    NSLog(@"List created with %d items",[_foodList count]);
}

- (void) saveFoodList
{
    NSMutableArray *rootObject = [NSMutableArray array];
    [rootObject setValue: _foodList forKey:@"foodList"];
    [NSKeyedArchiver archiveRootObject: _foodList toFile:[self getPath]];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:[self getPath]]){
        NSLog(@"Problem: File does not exist after saving");
    }

/*Old save method for serialising data, not as nice as archiving
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
        _foodList = [NSKeyedUnarchiver unarchiveObjectWithFile:[self getPath]];
        //Old load method for reading data from disc, matches above save method
        //      _foodList = [[NSMutableArray alloc] initWithContentsOfFile:[self getPath]];
    } else {
        NSLog(@"File load failed with no file found to load");
    }
}

//Methods for adding and removing a food from the list
- (void) addFoodToList:(TrackingFood *)newFood
{
    [_foodList addObject:newFood];
    [self saveFoodList];
}

- (void) addFoodToList:(TrackingFood *)newFood atPosition:(NSInteger)position
{
    [_foodList insertObject:newFood atIndex:position];
    [self saveFoodList];
}

- (void) removeFoodFromList:(NSInteger)indexToRemove
{
    [_foodList removeObjectAtIndex:indexToRemove];
    [self saveFoodList];
}

//Method list food names in one long string, for testing
- (void) listFoods
{
 TrackingFood *fooditem;
 NSString *foodstring = @"";
 for (fooditem in _foodList){
 foodstring = [foodstring stringByAppendingString:fooditem.food];
 foodstring = [foodstring stringByAppendingString:@" "];
 }
 NSLog(@"Food list is now: %@", foodstring);
}

@end