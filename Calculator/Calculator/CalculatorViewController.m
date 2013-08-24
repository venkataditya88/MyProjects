//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Venkat Aditya Timmaraju on 2/20/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Calculation.h"
#import <AVFoundation/AVFoundation.h>
@interface CalculatorViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelDisplayNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelDisplayMemory;
@property (weak, nonatomic) IBOutlet UILabel *labelDisplayDegreeRadian;
@property (weak, nonatomic) IBOutlet UILabel *labelDisplayOperation;
@property (nonatomic) Calculation *calculation;

@end

@implementation CalculatorViewController


- (Calculation *) calculation{
    if (!_calculation) _calculation = [[Calculation alloc
                                  ]init];
    
    return _calculation;
}

- (IBAction)numberPressed:(UIButton *)sender {
    if ([self.labelDisplayNumber.text isEqualToString:@"ERROR"]){
        self.labelDisplayNumber.text = [NSString stringWithFormat:@""];
    }
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation numberPressedWithValue:sender.tag andDisplayValue:self.labelDisplayNumber.text]];
}

- (IBAction)dotPressed:(UIButton *)sender {
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%@",[self.calculation dotButtonWithValue:self.labelDisplayNumber.text]];
}
- (IBAction)equalPressed:(UIButton *)sender {
    self.labelDisplayNumber.text = [self.calculation equalPressedWithOperation:self.labelDisplayOperation.text];
    self.labelDisplayOperation.text = [NSString stringWithFormat:@""];
    
}

- (IBAction)addtionPressed:(UIButton *)sender {
    self.labelDisplayOperation.text = [NSString stringWithFormat:@"+"];
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation addButton]];
    
}

- (IBAction)subtractionPressed:(UIButton *)sender {
    self.labelDisplayOperation.text = [NSString stringWithFormat:@"-"];
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation subtractButton]];
}
- (IBAction)multiplicationPressed:(UIButton *)sender {
    self.labelDisplayOperation.text = [NSString stringWithFormat:@"X"];
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation multiplyButton]];
}
- (IBAction)divisionPressed:(UIButton *)sender {
    self.labelDisplayOperation.text = [NSString stringWithFormat:@"/"];
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation divisionButton]];
}

- (IBAction)squarerootPressed:(UIButton *)sender {
    
    if([self.labelDisplayNumber.text doubleValue] < 0){
        self.labelDisplayNumber.text = [NSString stringWithFormat:@"ERROR"];
    }
    else{
        self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation squarerootOfValue:self.labelDisplayNumber.text]];
    }
    
}
- (IBAction)ypowerxPressed:(UIButton *)sender {
    self.labelDisplayOperation.text = [NSString stringWithFormat:@"^"];
    
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation ypowerxButton]];
}

- (IBAction)reciprocalPressed:(UIButton *)sender {
    if([self.labelDisplayNumber.text doubleValue] != 0) {
      self.labelDisplayNumber.text =[NSString stringWithFormat:@"%g",[self.calculation reciprocalOfValue: self.labelDisplayNumber.text]];
    }
    else{
        self.labelDisplayNumber.text = [NSString stringWithFormat:@"ERROR"];
    }
}

- (IBAction)inverseSignPressed:(UIButton *)sender {
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation inverseSignOfValue: self.labelDisplayNumber.text]];
}
- (IBAction)memoryRecall:(UIButton *)sender {
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation memoryRecallButton]];
    
}
- (IBAction)memoryAdd:(UIButton *)sender {
    [self.calculation memoryAddWithValue:self.labelDisplayNumber.text];
    self.labelDisplayMemory.text = [NSString stringWithFormat:@"M"];
}

- (IBAction)memorySubtract:(UIButton *)sender {
    [self.calculation memorySubtractByValue:self.labelDisplayNumber.text];
    self.labelDisplayMemory.text = [NSString stringWithFormat:@"M"];
}

- (IBAction)memoryClear:(UIButton *)sender {
    [self.calculation memoryClearButton];
    self.labelDisplayMemory.text = [NSString stringWithFormat:@""];
}
- (IBAction)sineValue:(UIButton *)sender {
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation sineOfValue:self.labelDisplayNumber.text ofType:self.labelDisplayDegreeRadian.text]];
}
- (IBAction)cosineValue:(UIButton *)sender {
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation cosineOfValue:self.labelDisplayNumber.text ofType:self.labelDisplayDegreeRadian.text]];
}
- (IBAction)tangentValue:(UIButton *)sender {
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation tangentOfValue:self.labelDisplayNumber.text ofType:self.labelDisplayDegreeRadian.text]];
}
- (IBAction)clear:(UIButton *)sender {
    
    [self.calculation clearButton];
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"0"];
    self.labelDisplayOperation.text = [NSString stringWithFormat:@""];
}
- (IBAction)backSpace:(UIButton *)sender {
    self.labelDisplayNumber.text = [self.calculation backSpaceOfValue: self.labelDisplayNumber.text];
    
    if ([self.labelDisplayNumber.text isEqualToString:@""]){
        
        self.labelDisplayNumber.text = [NSString stringWithFormat:@"0"];
    }
}
- (IBAction)piValue:(UIButton *)sender {
    
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation piButton]];
}
- (IBAction)degreeRadian:(UIButton *)sender {
    if ([self.labelDisplayDegreeRadian.text isEqualToString:@"DEG"]){
        self.labelDisplayDegreeRadian.text = [NSString stringWithFormat: @"RAD"];
    }
    else{
        self.labelDisplayDegreeRadian.text = [NSString stringWithFormat: @"DEG"];
    }
}
- (IBAction)eulerValue:(UIButton *)sender {
    self.labelDisplayNumber.text = [NSString stringWithFormat:@"%g",[self.calculation eulerButton]];
}

@end
