//
//  ObjectMoveConstraints.m
//  Algorithms
//
//  Created by Venkat Aditya Timmaraju on 5/14/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "ObjectMoveConstraints.h"

@implementation ObjectMoveConstraints

- (id)initWithFirstIndex:(NSInteger)firstIndex secondIndex:(NSInteger)secondIndex toMove:(BOOL)toMove isRange: (BOOL)isRange minChanged:(BOOL)minChanged andInformation:(NSString *)information{
    
    _firstIndex =firstIndex;
    _secondIndex = secondIndex;
    _toMove = toMove;
    _isRange = isRange;
    _minChanged = minChanged;
    _information = information;
    
    return self;
}

@end
