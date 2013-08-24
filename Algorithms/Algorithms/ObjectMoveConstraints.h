//
//  ObjectMoveConstraints.h
//  Algorithms
//
//  Created by Venkat Aditya Timmaraju on 5/14/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectMoveConstraints : NSObject
@property (nonatomic) NSInteger firstIndex;
@property (nonatomic) NSInteger secondIndex;
@property (nonatomic) BOOL toMove;
@property (nonatomic) BOOL isRange;
@property (nonatomic) BOOL minChanged;
@property (nonatomic, strong) NSString *information;

-(id) initWithFirstIndex: (NSInteger)firstIndex secondIndex: (NSInteger)secondIndex toMove: (BOOL)toMove isRange: (BOOL)isRange minChanged: (BOOL)minChanged andInformation: (NSString*) information;
@end
