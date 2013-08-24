//
//  Calculation.h
//  Calculator
//
//  Created by Venkat Aditya Timmaraju on 2/20/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculation : NSObject

- (double) numberPressedWithValue:(int)value andDisplayValue:(NSString *) displayValue;
- (NSString *) dotButtonWithValue:(NSString *)value;
- (double) addButton;
- (double) subtractButton;
- (double) multiplyButton;
- (double) divisionButton;
- (NSString *) equalPressedWithOperation:(NSString *) operation;
- (void) clearButton;
- (double) piButton;
- (double) ypowerxButton;
- (double) reciprocalOfValue:(NSString *)value;
- (double) inverseSignOfValue: (NSString *)value;
- (double) squarerootOfValue: (NSString *)value;
- (double) memoryRecallButton;
- (void) memoryAddWithValue: (NSString *)value;
- (void) memorySubtractByValue: (NSString *)value;
- (void) memoryClearButton;
- (double) sineOfValue: (NSString *)value ofType: (NSString *)type;
- (double) cosineOfValue: (NSString *)value ofType: (NSString *)type;
- (double) tangentOfValue: (NSString *)value ofType: (NSString *)type;
- (NSString *) backSpaceOfValue: (NSString *)value;
- (double) eulerButton;

@end
