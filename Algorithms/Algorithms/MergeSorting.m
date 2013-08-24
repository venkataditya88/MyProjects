//
//  MergeSorting.m
//  Algorithms
//
//  Created by Venkat Aditya Timmaraju on 5/14/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "MergeSorting.h"

@implementation MergeSorting
int height;
- (NSMutableArray *)sortArrayOfNumberObjects:(NSMutableArray *)arrayOfObjects{
    
    NSMutableArray *arrayOfObjectProperties = [[NSMutableArray alloc]init];
    
    //height++;
    [self mergeSortWithLowIndex:0 highIndex:arrayOfObjects.count - 1 arrayOfObjectProperties:arrayOfObjectProperties andArray:arrayOfObjects];
    

    return arrayOfObjectProperties;
    
}

-(void) mergeSortWithLowIndex: (NSInteger)lowIndex highIndex: (NSInteger)highIndex arrayOfObjectProperties: (NSMutableArray *)arrayOfObjectProperties andArray: (NSMutableArray *)arrayOfValues{
    
    if (lowIndex >= highIndex){
        
        return;
    }
    height++;
    ObjectMoveConstraints *objectMoveConstraints = [[ObjectMoveConstraints alloc] init];
    
    [arrayOfObjectProperties addObject:[objectMoveConstraints initWithFirstIndex:lowIndex secondIndex:highIndex toMove:YES isRange:YES minChanged:NO andInformation:@"Hello"]];
    
    NSInteger midIndex = (lowIndex + highIndex) / 2;
    
    [self mergeSortWithLowIndex:lowIndex highIndex:midIndex arrayOfObjectProperties:arrayOfObjectProperties andArray:arrayOfValues];
    [self mergeSortWithLowIndex:midIndex + 1 highIndex:highIndex arrayOfObjectProperties:arrayOfObjectProperties andArray:arrayOfValues];
    
    [self mergeWithLowIndex:lowIndex midIndex:midIndex highIndex:highIndex arrayOfObjectProperties:arrayOfObjectProperties andArray:arrayOfValues];
}

- (void) mergeWithLowIndex: (NSInteger)lowIndex midIndex: (NSInteger)midIndex highIndex: (NSInteger)highIndex arrayOfObjectProperties: (NSMutableArray*)arrayOfObjectProperties andArray:(NSMutableArray *)arrayOfValues{
    
    int i = lowIndex;
    int j = midIndex + 1;
    int l = lowIndex;
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithObjects:[arrayOfValues objectAtIndex:0], [arrayOfValues objectAtIndex:1], [arrayOfValues objectAtIndex:2], [arrayOfValues objectAtIndex:3], [arrayOfValues objectAtIndex:4], [arrayOfValues objectAtIndex:5], nil];
    
    while (i <= midIndex && j <= highIndex) {
        ObjectSwapConstraints *objectSwapConstraints = [[ObjectSwapConstraints alloc]init];
        if ([[arrayOfValues objectAtIndex:i] intValue] > [[arrayOfValues objectAtIndex:j] intValue]){
            
            [arrayOfObjectProperties addObject:[objectSwapConstraints initWithSoureIndex:j destinationIndex:l destinationHeight: height - 1 isSwapped:YES andInformation:@"Hello"]];
            [tempArray replaceObjectAtIndex:l withObject:[arrayOfValues objectAtIndex:j]];
            j++;
            l++;
            
        }
        else{
            [arrayOfObjectProperties addObject:[objectSwapConstraints initWithSoureIndex:i destinationIndex:l destinationHeight: height - 1 isSwapped:YES andInformation:@"Hello"]];
            [tempArray replaceObjectAtIndex:l withObject:[arrayOfValues objectAtIndex:i]];
            i++;
            l++;
            
        }
    }
    
    while (i <= midIndex) {
        ObjectSwapConstraints *objectSwapConstraints = [[ObjectSwapConstraints alloc]init];
        [arrayOfObjectProperties addObject:[objectSwapConstraints initWithSoureIndex:i destinationIndex:l destinationHeight: height - 1 isSwapped: YES andInformation:@"Hello"]];
        [tempArray replaceObjectAtIndex:l withObject:[arrayOfValues objectAtIndex:i]];
        i++;
        l++;
        
    }
    
    while (j <= highIndex) {
        ObjectSwapConstraints *objectSwapConstraints = [[ObjectSwapConstraints alloc]init];
        [arrayOfObjectProperties addObject:[objectSwapConstraints initWithSoureIndex:j destinationIndex:l destinationHeight: height - 1 isSwapped: YES andInformation:@"Hello"]];
        [tempArray replaceObjectAtIndex:l withObject:[arrayOfValues objectAtIndex:j]];
        j++;
        l++;
        
    }
    
    height--;
    
    for (int index = 0; index < arrayOfValues.count; index++) {
        
        [arrayOfValues replaceObjectAtIndex:index withObject:[tempArray objectAtIndex:index]];
    }
    
}

@end
