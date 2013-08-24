//
//  ObjectSwapConstraints.h
//  Algorithms
//
//  Created by Venkat Aditya Timmaraju on 5/14/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectSwapConstraints : NSObject
@property (nonatomic) NSInteger sourceIndex;
@property (nonatomic) NSInteger destinationIndex;
@property (nonatomic) NSInteger destinationHeight;
@property (nonatomic) BOOL isSwapped;
@property (nonatomic, strong) NSString *information;

- (id) initWithSoureIndex: (NSInteger)sourceIndex destinationIndex: (NSInteger) destinationIndex destinationHeight: (NSInteger) destinationHeight isSwapped: (BOOL)isSwapped andInformation: (NSString *) information;
@end
