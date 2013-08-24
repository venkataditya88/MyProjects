//
//  InsertionSorting.m
//  Algorithms
//
//  Created by Venkat Aditya Timmaraju on 5/14/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "InsertionSorting.h"

@implementation InsertionSorting
- (NSMutableArray *)sortArrayOfNumberObjects:(NSMutableArray *)arrayOfObjects{
    
    //NSLog(@"Insertion Sort Called");
    
    NSMutableArray *arrayOfObjectProperties = [[NSMutableArray alloc]init];
    
    
    for (int index = 0; index < arrayOfObjects.count - 1; index++){
        ObjectMoveConstraints *objectMoveConstraints = [[ObjectMoveConstraints alloc]init];
        if ([[arrayOfObjects objectAtIndex:index] intValue] > [[arrayOfObjects objectAtIndex:index + 1] intValue]){
            
            for (int inner_index = index + 1; inner_index > 0; inner_index--){
                
                ObjectMoveConstraints *inner_objectMoveConstraints = [[ObjectMoveConstraints alloc]init];
                ObjectSwapConstraints *objectSwapConstraints = [[ObjectSwapConstraints alloc]init];
                if ([[arrayOfObjects objectAtIndex:inner_index] intValue] < [[arrayOfObjects objectAtIndex:inner_index - 1] intValue]){
                    
                    
                    [arrayOfObjectProperties addObject:[inner_objectMoveConstraints initWithFirstIndex:inner_index secondIndex:inner_index - 1 toMove:YES isRange:NO minChanged:NO andInformation:@"Hello"]];
                    [arrayOfObjectProperties addObject:[objectSwapConstraints initWithSoureIndex:inner_index destinationIndex:inner_index - 1 destinationHeight: 0 isSwapped:YES andInformation:@"Hello"]];
                    //[arrayOfObjectProperties addObject:[objectSwapConstraints initWithSoureIndex:inner_index - 1 destinationIndex:inner_index andInformation:@"Hello"]];
                    [arrayOfObjects exchangeObjectAtIndex:inner_index withObjectAtIndex:inner_index - 1];
                    
                }
                else {
                    
                    [arrayOfObjectProperties addObject:[inner_objectMoveConstraints initWithFirstIndex:inner_index secondIndex:inner_index - 1 toMove:NO isRange:NO minChanged:NO andInformation:@"Hello"]];
                }
                
            }
        }
        else{
            
            [arrayOfObjectProperties addObject:[objectMoveConstraints initWithFirstIndex:index secondIndex:index + 1 toMove:NO isRange:NO minChanged:NO andInformation:@"Hello"]];
            
        }
	}
    
    return arrayOfObjectProperties;
    
}
@end
