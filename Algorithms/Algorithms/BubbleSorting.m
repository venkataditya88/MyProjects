//
//  BubbleSorting.m
//  Algorithms
//
//  Created by Venkat Aditya Timmaraju on 5/14/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "BubbleSorting.h"

@implementation BubbleSorting

- (NSMutableArray *)sortArrayOfNumberObjects:(NSMutableArray *)arrayOfObjects{
    
    BOOL swapped = NO;
    NSMutableArray *arrayOfObjectProperties = [[NSMutableArray alloc]init];
    
    
    while(!swapped){
 		swapped = YES;
 		for(int index = 0; index < arrayOfObjects.count - 1; index++){
            ObjectMoveConstraints *objectMoveConstraints = [[ObjectMoveConstraints alloc]init];
            ObjectSwapConstraints *objectSwapConstraints = [[ObjectSwapConstraints alloc]init];
            if ([arrayOfObjects[index] intValue]> [arrayOfObjects[index + 1] intValue]){
                
                swapped = NO;
                [arrayOfObjectProperties addObject:[objectMoveConstraints initWithFirstIndex:index secondIndex:index + 1 toMove:YES isRange:NO minChanged:NO andInformation:@"Hello"]];
                [arrayOfObjectProperties addObject:[objectSwapConstraints initWithSoureIndex:index destinationIndex:index + 1 destinationHeight: 0 isSwapped:YES andInformation:@"Hello"]];

                [arrayOfObjects exchangeObjectAtIndex:index withObjectAtIndex:index + 1];
            }
            else{
                
                [arrayOfObjectProperties addObject:[objectMoveConstraints initWithFirstIndex:index secondIndex:index + 1 toMove:NO isRange:NO minChanged:NO andInformation:@"Hello"]];
            }
 		}
    }
    
    return arrayOfObjectProperties;
    
}

@end
