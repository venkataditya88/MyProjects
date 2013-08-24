//
//  SelectionSorting.m
//  Algorithms
//
//  Created by Venkat Aditya Timmaraju on 5/14/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "SelectionSorting.h"

@implementation SelectionSorting

- (NSMutableArray *)sortArrayOfNumberObjects:(NSMutableArray *)arrayOfObjects{
    
    NSMutableArray *arrayOfObjectProperties = [[NSMutableArray alloc]init];
    
    int minIndex;
    BOOL minChanged = NO;
    for (int index = 0; index < arrayOfObjects.count; index++){
        ObjectMoveConstraints *objectMoveConstraints = [[ObjectMoveConstraints alloc]init];
        ObjectSwapConstraints *objectSwapConstraints = [[ObjectSwapConstraints alloc]init];
        minIndex = index;
        
        for (int inner_index = index + 1; inner_index < arrayOfObjects.count; inner_index++){
            ObjectMoveConstraints *inner_objectMoveConstraints = [[ObjectMoveConstraints alloc]init];
            [arrayOfObjectProperties addObject:[inner_objectMoveConstraints initWithFirstIndex:minIndex   secondIndex:inner_index toMove:NO isRange:NO minChanged:minChanged andInformation:@"Hello"]];
            minChanged = NO;
            if ([[arrayOfObjects objectAtIndex:inner_index] intValue] < [[arrayOfObjects objectAtIndex:minIndex] intValue]){
                
                minIndex = inner_index;
                minChanged = YES;
            }
            
            //[arrayOfObjectProperties addObject:[inner_objectMoveConstraints initWithFirstIndex:minIndex   secondIndex:inner_index toMove:NO isRange:NO andInformation:@"Hello"]];
        }
        
        if (minIndex != index){
            [arrayOfObjectProperties addObject:[objectMoveConstraints initWithFirstIndex:minIndex   secondIndex:index toMove:YES isRange:NO minChanged:NO andInformation:@"Hello"]];
            [arrayOfObjectProperties addObject:[objectSwapConstraints initWithSoureIndex:minIndex destinationIndex:index destinationHeight:0 isSwapped:YES andInformation:@"Hello"]];
            //[arrayOfObjectProperties addObject:[objectSwapConstraints initWithSoureIndex:index destinationIndex:minIndex andInformation:@"Hello"]];
            [arrayOfObjects exchangeObjectAtIndex:minIndex withObjectAtIndex:index];
        }
        else{
            [arrayOfObjectProperties addObject:[objectSwapConstraints initWithSoureIndex:minIndex destinationIndex:index destinationHeight:0 isSwapped:NO andInformation:@"Hello"]];
        }
    }
    
    return arrayOfObjectProperties;
}
@end
