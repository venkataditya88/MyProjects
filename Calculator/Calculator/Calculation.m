//
//  Calculation.m
//  Calculator
//
//  Created by Venkat Aditya Timmaraju on 2/20/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "Calculation.h"
#define PI 3.14
#define e 2.718
@implementation Calculation

double currentNumber;
double memory;
double enteredNumber;
NSString *numberWithDot;
bool equalTapped;
bool decimalTapped;

- (double) calculateCurrentValue: (NSString *)currentValueString withValueTapped:(NSString*) valueTapped{
    
    return [[currentValueString stringByAppendingString:valueTapped] doubleValue];
    
}

- (double) numberPressedWithValue:(int)value andDisplayValue: (NSString*) displayValue{
    
    if(equalTapped == true){
        currentNumber = 0;
        enteredNumber = 0;
    }
    
    if (currentNumber == 0 && decimalTapped == false) {
        currentNumber = [self calculateCurrentValue:[NSString stringWithFormat:@""] withValueTapped:[NSString stringWithFormat:@"%d", value]];

    }
    else{
        if(decimalTapped == true)
            currentNumber = [self calculateCurrentValue:displayValue  withValueTapped:[NSString stringWithFormat:@"%d", value]];
        else
            currentNumber = [self calculateCurrentValue:[NSString stringWithFormat:@"%g", currentNumber] withValueTapped:[NSString stringWithFormat:@"%d", value]];
    }
    equalTapped = false;
    return currentNumber;
}
 

- (double) addButton{
    if(equalTapped == true){
        currentNumber = 0;
    }
    enteredNumber = enteredNumber + currentNumber;
    currentNumber = 0;
    equalTapped = false;
    decimalTapped = false;
    return enteredNumber;
}

- (double) subtractButton{
    if (equalTapped == true) {
        currentNumber = 0;
    }
    if (enteredNumber != 0){
       enteredNumber = enteredNumber - currentNumber; 
    }
    else{
        enteredNumber = currentNumber;
    }
    currentNumber = 0;
    //currentNumberString = NULL;
    equalTapped = false;
    decimalTapped = false;
    return enteredNumber;
}

- (double) multiplyButton{
    
    if (equalTapped == true){
        currentNumber = 1;
    }
    if (enteredNumber != 0) {
        enteredNumber = enteredNumber * currentNumber; 
    }
    else{
        enteredNumber = currentNumber;
    }
    currentNumber = 0;
    //currentNumberString = NULL;
    equalTapped = false;
    decimalTapped = false;
    return enteredNumber;
}

- (double) divisionButton{
    
    if (equalTapped == true){
        currentNumber = 1;
    }
    if (enteredNumber != 0){
        enteredNumber = enteredNumber / currentNumber;
    }
    else{
        enteredNumber = currentNumber;
    }
    currentNumber = 0;
    //currentNumberString = NULL;
    equalTapped = false;
    decimalTapped = false;
    return enteredNumber;
}

- (NSString *) equalPressedWithOperation:(NSString *)operation{
   
    if (currentNumber == 0){
        [self clearButton];
        return [NSString stringWithFormat:@"ERROR"];
    }
    if ([operation isEqualToString:@"+"]){
        enteredNumber += currentNumber;
    }
    else if ([operation isEqualToString:@"-"]){
        enteredNumber -= currentNumber;
    }
    else if([operation isEqualToString:@"X"]){
        enteredNumber *= currentNumber;
    }
    else if ([operation isEqualToString:@"/"]){
        enteredNumber /= currentNumber;
    }
    else if ([operation isEqualToString:@"^"]){
        enteredNumber = pow(enteredNumber, currentNumber);
    }
    else{
        enteredNumber = currentNumber;
    }
    equalTapped = true;
    return [NSString stringWithFormat: @"%g",enteredNumber];
}

- (void) clearButton{
    enteredNumber = 0;
    currentNumber = 0;
    equalTapped = false;
    
}

- (double) piButton{
    currentNumber = PI;
    return currentNumber;
}

- (double) eulerButton{
    currentNumber = e;
    return currentNumber;
}

- (double) ypowerxButton{
    if(equalTapped == true){
        currentNumber = 1;
    }
    if (enteredNumber != 0){
        enteredNumber =  pow(enteredNumber, currentNumber);
    }
    else{
        enteredNumber = currentNumber;
    }
    currentNumber = 0;
    equalTapped = false;
    decimalTapped = false;
    return enteredNumber;
}

- (double) reciprocalOfValue:(NSString *)value{
    
    decimalTapped = false;
    enteredNumber = 1 / [value doubleValue];
    currentNumber = 0;
    return enteredNumber;
}

- (double) inverseSignOfValue: (NSString *)value{
    
    decimalTapped = false;
    enteredNumber = 0 - [value doubleValue];
    currentNumber = 0;
    return enteredNumber;
}

- (double)squarerootOfValue: (NSString *) value{
    
    decimalTapped = false;
    enteredNumber = sqrt([value doubleValue]);
    currentNumber = 0;
    return enteredNumber;
}

- (NSString *) dotButtonWithValue:(NSString *)value{
    decimalTapped = true;
    if (currentNumber == 0){
        value = [NSString stringWithFormat:@"0"];
    }
    if([value rangeOfString:@"."].location == NSNotFound){
        
        return [value stringByAppendingString:@"."];
        
    }
    else{
        return value;
    }
    
}

- (double) sineOfValue:(NSString *)value ofType: (NSString *)type{
    decimalTapped = false;
    if ([type isEqualToString:@"DEG"]){
        enteredNumber = sin(([value doubleValue] * PI )/ 180);
    }
    else{
       enteredNumber = sin([value doubleValue]); 
    }
    currentNumber = 0;
    return enteredNumber;
}

- (double) cosineOfValue:(NSString *)value ofType: (NSString *)type{
    decimalTapped = false;
    if ([type isEqualToString:@"DEG"]){
        enteredNumber =  cos(([value doubleValue] * PI )/ 180);
    }
    else{
        enteredNumber = cos([value doubleValue]);
    }
    currentNumber = 0;
    return enteredNumber;
}

- (double) tangentOfValue:(NSString *)value ofType: (NSString *)type{
    decimalTapped = false;
    if ([type isEqualToString:@"DEG"]){
        enteredNumber = tan(([value doubleValue] * PI )/ 180);
    }
    else{
        enteredNumber = tan([value doubleValue]);
    }
    currentNumber = 0;
    return enteredNumber;
}

- (double) memoryRecallButton{
    currentNumber = memory;
    return memory;
}

- (void) memoryClearButton{
    memory = 0;
}

- (void) memoryAddWithValue:(NSString *)value{
    memory += [value doubleValue];
}

- (void) memorySubtractByValue:(NSString *)value{
    memory -= [value doubleValue];
}

- (NSString *) backSpaceOfValue: (NSString *)value{
    if ( [value length] > 0)
        value = [value substringToIndex:[value length] - 1];
    currentNumber = [value doubleValue];
    return value;
}

@end
