//
//  ObjectSwapConstraints.m
//  Algorithms
//
//  Created by Venkat Aditya Timmaraju on 5/14/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "ObjectSwapConstraints.h"

@implementation ObjectSwapConstraints

- (id)initWithSoureIndex:(NSInteger)sourceIndex destinationIndex:(NSInteger)destinationIndex destinationHeight: (NSInteger)destinationHeight isSwapped:(BOOL)isSwapped andInformation:(NSString *)information{
    
    _sourceIndex = sourceIndex;
    _destinationIndex = destinationIndex;
    _destinationHeight = destinationHeight;
    _isSwapped = isSwapped;
    _information = information;
    
    return self;
}
@end
