//
//  SortingLearnViewController.m
//  Algorithms
//
//  Created by Venkat Aditya Timmaraju on 5/14/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "SortingLearnViewController.h"
#import "SelectionSorting.h"
#import "InsertionSorting.h"
#import "BubbleSorting.h"
#import "MergeSorting.h"
@interface SortingLearnViewController ()
@property (weak, nonatomic) IBOutlet UIButton *number1;
@property (weak, nonatomic) IBOutlet UIButton *number2;
@property (weak, nonatomic) IBOutlet UIButton *number3;
@property (weak, nonatomic) IBOutlet UIButton *number4;
@property (weak, nonatomic) IBOutlet UIButton *number5;
@property (weak, nonatomic) IBOutlet UIButton *number6;

@property (weak, nonatomic) IBOutlet UILabel *passCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *informationLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrow1;

@property (weak, nonatomic) IBOutlet UILabel *arrow2;
@property (weak, nonatomic) IBOutlet UILabel *arrow3;
@property (weak, nonatomic) IBOutlet UILabel *arrow4;
@property (weak, nonatomic) IBOutlet UILabel *arrow5;
@property (weak, nonatomic) IBOutlet UILabel *arrow6;
@property (weak, nonatomic) IBOutlet UIButton *start;
@property (weak, nonatomic) IBOutlet UIButton *pass;
@property (weak, nonatomic) IBOutlet UIView *endView;

@property (strong, nonatomic) NSMutableArray *arrayOfObjectCenterCoordinate;
@property (strong,nonatomic) NSMutableArray *arrayOfHeightCoordinates;
@property (strong, nonatomic) NSMutableArray *arrayOfNumberObjects;
@property (strong, nonatomic) NSMutableArray *arrayOfMovableObjects;
@property (strong, nonatomic) NSMutableArray *arrayOfButtons;
@property (strong, nonatomic) NSMutableArray *arrayOfButtonsHeight;
@property (nonatomic) NSInteger height;
@property (nonatomic) NSInteger index;
@end

@implementation SortingLearnViewController
BOOL isSwapped = NO;
- (NSMutableArray *) arrayOfNumberObjects{
    if (!_arrayOfNumberObjects) _arrayOfNumberObjects = [[NSMutableArray alloc
                                                          ]init];
    
    return _arrayOfNumberObjects;
}

- (NSMutableArray *) arrayOfObjectCenterCoordinate{
    if (!_arrayOfObjectCenterCoordinate) _arrayOfObjectCenterCoordinate = [[NSMutableArray alloc
                                                                            ]init];
    
    return _arrayOfObjectCenterCoordinate;
}

- (NSMutableArray *) arrayOfMovableObjects{
    if (!_arrayOfMovableObjects) _arrayOfMovableObjects = [[NSMutableArray alloc
                                                            ]init];
    
    return _arrayOfMovableObjects;
}

- (NSMutableArray *) arrayOfButtons{
    if (!_arrayOfButtons) _arrayOfButtons = [[NSMutableArray alloc
                                                            ]init];
    
    return _arrayOfButtons;
}

- (NSMutableArray *) arrayOfHeightCoordinates{
    if (!_arrayOfHeightCoordinates) _arrayOfHeightCoordinates = [[NSMutableArray alloc
                                              ]init];
    
    return _arrayOfHeightCoordinates;
}

- (NSMutableArray *) arrayOfButtonsHeight{
    if (!_arrayOfButtonsHeight) _arrayOfButtonsHeight = [[NSMutableArray alloc
                                                                  ]init];
    
    return _arrayOfButtonsHeight;
}

- (void) setSortType:(NSString *)sortType{
    
    _sortType = sortType;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.index = 0;
    Sorting *sorting;
    self.endView.hidden = YES;
    //NSLog(@"%@", self.sortType);
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:10] atIndex:0];
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:self.number1.center] atIndex:0];
    [self.number1 setTitle:[[self.arrayOfNumberObjects objectAtIndex:0] stringValue] forState:UIControlStateNormal];
    [self.arrayOfButtons insertObject:self.number1 atIndex:0];
    
    
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:39] atIndex:1];
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:self.number2.center] atIndex:1];
    [self.number2 setTitle:[[self.arrayOfNumberObjects objectAtIndex:1] stringValue]forState:UIControlStateNormal];
    [self.arrayOfButtons insertObject:self.number2 atIndex:1];
    
    
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:19] atIndex:2];
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:self.number3.center] atIndex:2];
    [self.number3 setTitle:[[self.arrayOfNumberObjects objectAtIndex:2] stringValue] forState:UIControlStateNormal];
    [self.arrayOfButtons insertObject:self.number3 atIndex:2];
    
    
    
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:81] atIndex:3];
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:self.number4.center] atIndex:3];
    [self.number4 setTitle:[[self.arrayOfNumberObjects objectAtIndex:3] stringValue]forState:UIControlStateNormal];
    [self.arrayOfButtons insertObject:self.number4 atIndex:3];
    
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:43] atIndex:4];
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:self.number5.center] atIndex:4];
    [self.number5 setTitle:[[self.arrayOfNumberObjects objectAtIndex:4] stringValue]forState:UIControlStateNormal];
    [self.arrayOfButtons insertObject:self.number5 atIndex:4];
    
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:50] atIndex:5];
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:self.number6.center] atIndex:5];
    [self.number6 setTitle:[[self.arrayOfNumberObjects objectAtIndex:5] stringValue]forState:UIControlStateNormal];
    [self.arrayOfButtons insertObject:self.number6 atIndex:5];
    


    [self hideArrow];
    [self setButtonColor];
    self.passCountLabel.text = @"";
    self.informationLabel.text = @"";
    self.pass.hidden = YES;
    if ([self.sortType isEqualToString:@"Selection Sort"]) {
        sorting = [[SelectionSorting alloc] init];
    }
    else if([self.sortType isEqualToString:@"Insertion Sort"]) {
        sorting = [[InsertionSorting alloc] init];
        
    }
    else if([self.sortType  isEqualToString:@"Bubble Sort"]) {
        
        sorting = [[BubbleSorting alloc] init];
    }
    else if([self.sortType isEqualToString:@"Merge Sort"]) {
        
        sorting = [[MergeSorting alloc] init];
    }
    
    self.arrayOfMovableObjects = [sorting sortArrayOfNumberObjects:self.arrayOfNumberObjects];
}


- (IBAction)nextPass:(UIButton *)sender {
    
    //static int index = 0;

    if (self.index < self.arrayOfMovableObjects.count) {

        [self hideArrow];
        [self setButtonColor];

            if ([[self.arrayOfMovableObjects objectAtIndex:self.index] isKindOfClass:[ObjectMoveConstraints class]]) {

                
                ObjectMoveConstraints *objectmoveConstraints = [self.arrayOfMovableObjects objectAtIndex:self.index];
                NSLog(@"Move: %d, %d, %d, %d, %@ ", objectmoveConstraints.firstIndex, objectmoveConstraints.secondIndex, objectmoveConstraints.toMove, objectmoveConstraints.isRange, objectmoveConstraints.information);
                if (isSwapped && [self.sortType isEqualToString:@"Selection Sort"]) {
                    
                    self.informationLabel.text = [NSString stringWithFormat:@"%@%d%@",@"For this iteration we start at position ", objectmoveConstraints.firstIndex, @" and assume the value at this position to be minimum "];
                    UIButton *button = [self getButtonForIndex:objectmoveConstraints.firstIndex];
                    UILabel *arrow = [self getArrowAtIndex:objectmoveConstraints.firstIndex];
                    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                    arrow.hidden = NO;
                    isSwapped = NO;
                    return;
                }
                [self getInformationFromSourceIndex:objectmoveConstraints.firstIndex destinationIndex:objectmoveConstraints.secondIndex minChanged:objectmoveConstraints.minChanged andToMove:objectmoveConstraints.toMove];
                UILabel *arrow1 = [self getArrowAtIndex:objectmoveConstraints.firstIndex];
                UILabel *arrow2 = [self getArrowAtIndex:objectmoveConstraints.secondIndex];
                UIButton *button1 = [self getButtonForIndex:objectmoveConstraints.firstIndex];
                UIButton *button2 = [self getButtonForIndex:objectmoveConstraints.secondIndex];
                arrow1.hidden = NO;
                arrow2.hidden = NO;

                if ([self.sortType isEqualToString:@"Selection Sort"]) {
                    if ( (self.index + 1 < self.arrayOfMovableObjects.count) && [[self.arrayOfMovableObjects objectAtIndex:self.index + 1] isKindOfClass:[ObjectMoveConstraints class]]) {
                            ObjectMoveConstraints *inner_objectmoveConstraints = [self.arrayOfMovableObjects objectAtIndex:self.index + 1];
                            if (objectmoveConstraints.firstIndex != inner_objectmoveConstraints.firstIndex) {
                                self.informationLabel.text = [NSString stringWithFormat:@"%@%d%@%d", @"We have a new minimum value at position ", inner_objectmoveConstraints.firstIndex + 1, @" because the number at this position is less than the number we assumed to be minimum previously at position ",objectmoveConstraints.firstIndex + 1];
                            }
                            else{
                                self.informationLabel.text = [NSString stringWithFormat:@"%@%d%@%d", @"Value at position ", objectmoveConstraints.firstIndex + 1, @" is the minimum value because it is less then the value at position ", objectmoveConstraints.secondIndex + 1];
                            }
                        }
                    
                }
                [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [button2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                if (objectmoveConstraints.toMove){
                    [self moveAnimateWithStartIndex:objectmoveConstraints.firstIndex andEndIndex:objectmoveConstraints.secondIndex isRange:objectmoveConstraints.isRange];
                }
            }

                if ([[self.arrayOfMovableObjects objectAtIndex:self.index] isKindOfClass:[ObjectSwapConstraints class]]) {

                    ObjectSwapConstraints  *objectSwapConstraints = [self.arrayOfMovableObjects objectAtIndex:self.index];
                    NSLog(@"Swap: %d, %d, %d, %@", objectSwapConstraints.sourceIndex, objectSwapConstraints.destinationIndex, objectSwapConstraints.destinationHeight,objectSwapConstraints.information);
                    isSwapped = YES;
                    if (objectSwapConstraints.isSwapped) {
                        if ([self.sortType isEqualToString:@"Selection Sort"]) {
                            self.informationLabel.text = [NSString stringWithFormat:@"%@%d%@%d%@", @"The value at position", objectSwapConstraints.sourceIndex, @" is less than the value at position ", objectSwapConstraints.destinationIndex, @" . So they are swapped"];
                        }
                         
                        [self swapAnimateWithSourceIndex:objectSwapConstraints.sourceIndex destinationIndex:objectSwapConstraints.destinationIndex];
                    }
                    else{
                        if ([self.sortType isEqualToString:@"Selection Sort"]) {
                            self.informationLabel.text = @"There is no swapping of values in this iteration because the value at the start index for this iteration is minimum";
                        }
                        else if ([self.sortType isEqualToString:@"Bubble Sort"]){
                            self.informationLabel.text = [NSString stringWithFormat:@"%@%d%@%d", @"The values did not swap because the value at position", objectSwapConstraints.sourceIndex, @" is less than the value at position ", objectSwapConstraints.destinationIndex];
                        }
                    }
        
                }

        self.index++;
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Completed"
                              message: @"You can go back and learn other algorithms"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    
    
}

- (void) moveAnimateWithStartIndex: (NSInteger)startIndex andEndIndex: (NSInteger) endIndex isRange: (BOOL) isRange{
    UIButton *firstNumberButton;
    UIButton *secondNumberButton;
    CGPoint fillPoint = CGPointMake(0, 0);
    UIButton *button;
    NSMutableArray *arrayOfPoint = [[NSMutableArray alloc]init];
    NSMutableArray *arrayOfButtonPoint = [[NSMutableArray alloc]init];
    if(isRange){
        if (startIndex != 0) {
            for (int index = 0; index < startIndex; index++) {
                [arrayOfButtonPoint insertObject:button atIndex:index];
                [arrayOfPoint insertObject:[NSValue valueWithCGPoint:fillPoint] atIndex:index];
            }
        }
        int index = startIndex;
        for (; index <= endIndex/2; index++) {
            UIButton *firstNumberButton;
            firstNumberButton = [self getButtonForIndex:index];

            [arrayOfButtonPoint insertObject:firstNumberButton atIndex:index];
            [arrayOfPoint insertObject:[NSValue valueWithCGPoint:CGPointMake(firstNumberButton.center.x - 5, firstNumberButton.center.y + 30)] atIndex:index];
            [UIView animateWithDuration:0.5 animations:^{
                
                firstNumberButton.center = [[arrayOfPoint objectAtIndex:index] CGPointValue];
            } completion:^(BOOL finished) {
                
            }];
        }
        
        for (; index <= endIndex; index++) {
            UIButton *firstNumberButton;
            firstNumberButton = [self getButtonForIndex:index];

            [UIView animateWithDuration:0.5 animations:^{
                
                firstNumberButton.center = [[arrayOfPoint objectAtIndex:index] CGPointValue];
            } completion:^(BOOL finished) {
                
            }];
        }

    }
    else{


        firstNumberButton = [self getButtonForIndex:startIndex];
        secondNumberButton = [self getButtonForIndex:endIndex];
        
        CGPoint firstButtonNewLocation = CGPointMake(firstNumberButton.center.x, firstNumberButton.center.y + 30);
        CGPoint secondButtonNewLocation = CGPointMake(secondNumberButton.center.x, secondNumberButton.center.y + 30);
        
        [UIView animateWithDuration:0.5 animations:^{
            
            firstNumberButton.center = firstButtonNewLocation;
            secondNumberButton.center = secondButtonNewLocation;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
}

- (void) swapAnimateWithSourceIndex: (NSInteger) sourceIndex destinationIndex: (NSInteger)destinationIndex {
    UIButton *firstNumberButton;
    UIButton *secondNumberButton;
    firstNumberButton = [self getButtonForIndex:sourceIndex];
    secondNumberButton = [self getButtonForIndex:destinationIndex];
    [self.arrayOfButtons exchangeObjectAtIndex:sourceIndex withObjectAtIndex:destinationIndex];
    
    if ([self.sortType isEqualToString:@"Selection Sort"] || [self.sortType isEqualToString:@"Insertion Sort"] || [self.sortType isEqualToString:@"Bubble Sort"]) {
        [UIView animateWithDuration:0.5 animations:^{
            
            firstNumberButton.center = [[self.arrayOfObjectCenterCoordinate objectAtIndex:destinationIndex] CGPointValue];
            secondNumberButton.center = [[self.arrayOfObjectCenterCoordinate objectAtIndex:sourceIndex] CGPointValue];
            
        } completion:^(BOOL finished) {
            if (finished && [self.sortType isEqualToString:@"Selection Sort"]) {
                self.informationLabel.text = @"Let us go for the next iteration";
            }
        }];
     }
     else{
         
         [UIView animateWithDuration:0.5 animations:^{
             //Future Work
             //firstNumberButton.center = destinationPoint;
             //secondNumberButton.center = [[self.arrayOfObjectCenterCoordinate objectAtIndex: (([self.arrayOfButtons count]) * height) + sourceIndex] CGPointValue];
             
         } completion:^(BOOL finished) {
         }];
     }
    
    
}

- (UIButton *)getButtonForIndex: (NSUInteger)index{
    
    return [self.arrayOfButtons objectAtIndex:index];
}

- (UILabel*) getArrowAtIndex: (NSInteger)index{
    UILabel *label;
    switch (index) {
        case 0:{
            return self.arrow1;
            break;
        }
        
        case 1:{
            return self.arrow2;
            break;
        }
        
        case 2:{
            return self.arrow3;
            break;
        }
        
        case 3:{
            return self.arrow4;
            break;
        }
        
        case 4:{
            return self.arrow5;
            break;
        }
        
        case 5:{
            return self.arrow6;
            break;
        }
            
    }
    return label;
}
- (IBAction)startButton:(UIButton*)sender {
    
    self.pass.hidden = NO;
    self.start.hidden = YES;
    if ([self.sortType isEqualToString:@"Selection Sort"]) {
        self.informationLabel.text = @"At starting we assume that the number at position 1 is the minimum element and then we iterate through all the element to find the minimum";
        [self.number1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.arrow1.hidden = NO;
    }
    else if ([self.sortType isEqualToString:@"Insertion Sort"]){
        self.informationLabel.text = @"Insertion Sort";
        [self.number1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.arrow1.hidden = NO;
    }
    else if ([self.sortType isEqualToString:@"Bubble Sort"]){
        self.informationLabel.text = @"In bubble sort we iterate through all the elements to swap the value with its next position value if it is greater and the process continous untill we have no swapping in an iteration. Let us start with our first iteration";
        [self.number1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.arrow1.hidden = NO;
    }
    
    
}

- (NSString *)getInformationFromSourceIndex: (NSInteger)sourceIndex destinationIndex: (NSInteger)destinationIndex minChanged: (BOOL)minChanged andToMove: (BOOL)toMove{
    if ([self.sortType isEqualToString:@"Selection Sort"]) {
        //
        if (toMove) {
            self.informationLabel.text = [NSString stringWithFormat:@"%@%d%@%d",@"Let us swap the minimum value found at position ", sourceIndex + 1, @" with the first position element at ", destinationIndex + 1];
        }
        else{
            
        }
    }
    else if ([self.sortType isEqualToString:@"Bubble Sort"]){
        if (toMove) {
            self.informationLabel.text = [NSString stringWithFormat:@"%@%d%@%d%@",@" The value  at position ", sourceIndex + 1, @" is greater than the value at position", destinationIndex + 1, @" .Let us swap those values"];
        }
        else{
            self.informationLabel.text = [NSString stringWithFormat:@"%@%d%@%d%@",@" The value  at position ", sourceIndex + 1, @" is not greater than the value at position ", destinationIndex + 1, @" .There will be no swapping of values"];
        }
    }
    else if ([self.sortType isEqualToString:@"Insertion Sort"]){
        //
    }
    
    return @"";
}

- (void)hideArrow{
    
    self.arrow1.hidden = YES;
    self.arrow2.hidden = YES;
    self.arrow3.hidden = YES;
    self.arrow4.hidden = YES;
    self.arrow5.hidden = YES;
    self.arrow6.hidden = YES;
}

- (void)setButtonColor{
    [self.number1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.number2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.number3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.number4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.number5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.number6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}

@end
