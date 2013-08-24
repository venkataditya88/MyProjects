//
//  SortingPuzzleViewController.m
//  Algorithms
//
//  Created by Venkat Aditya Timmaraju on 5/14/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "SortingPuzzleViewController.h"
#import "SelectionSorting.h"
#import "InsertionSorting.h"
#import "BubbleSorting.h"
#import "MergeSorting.h"
@interface SortingPuzzleViewController ()
@property (strong, nonatomic) NSMutableArray *arrayOfNumberObjects;
@property (strong, nonatomic) NSMutableArray *arrayOfMovableObjects;
@property (weak, nonatomic) IBOutlet UIButton *start;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (strong, nonatomic) NSMutableArray *arrayOfButtons;
@property (strong, nonatomic) NSMutableArray *arrayOfObjectCenterCoordinate;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong,nonatomic) NSMutableArray *arrayOfOldPoints;
@property (nonatomic) NSInteger index;
@property (nonatomic) NSInteger score;
@end

@implementation SortingPuzzleViewController

UIView *view1;
UIView *view2;
UIView *view3;
UIView *view4;
UIView *view5;
UIView *view6;
UIView *view7;
UIView *view8;
UIView *view9;
UIView *view10;
UIView *view11;
UIView *view12;
UIView *view13;
UIView *view14;
UIView *view15;
UIView *view16;
UIView *view17;
UIView *view18;
UIView *view19;
UIView *view20;
UIView *view21;
UIView *view22;
UIView *view23;

UIButton *number1;
UIButton *number2;
UIButton *number3;
UIButton *number4;
UIButton *number5;
UIButton *number6;

CGPoint oldPoint;

- (NSMutableArray *) arrayOfNumberObjects{
    if (!_arrayOfNumberObjects) _arrayOfNumberObjects = [[NSMutableArray alloc
                                                          ]init];
    
    return _arrayOfNumberObjects;
}

- (NSMutableArray *) arrayOfOldPoints{
    if (!_arrayOfOldPoints) _arrayOfOldPoints = [[NSMutableArray alloc
                                                          ]init];
    
    return _arrayOfOldPoints;
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

- (NSMutableArray *) arrayOfObjectCenterCoordinate{
    if (!_arrayOfObjectCenterCoordinate) _arrayOfObjectCenterCoordinate = [[NSMutableArray alloc
                                                                            ]init];
    
    return _arrayOfObjectCenterCoordinate;
}

- (void) setSortType:(NSString *)sortType{
    
    _sortType = sortType;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSLog(@"%@", self.sortType);
    self.index = 0;
    self.score = 0;
    Sorting *sorting;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.score];
    self.next.hidden = YES;

    
    number1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    number2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    number3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    number4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    number5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    number6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [self.arrayOfButtons insertObject:number1 atIndex:0];
    [self.arrayOfButtons insertObject:number2 atIndex:1];
    [self.arrayOfButtons insertObject:number3 atIndex:2];
    [self.arrayOfButtons insertObject:number4 atIndex:3];
    [self.arrayOfButtons insertObject:number5 atIndex:4];
    [self.arrayOfButtons insertObject:number6 atIndex:5];
    

    
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(33, 138, 36, 36)];
    [view1.layer setBorderWidth:0.8];
    number1.frame = CGRectMake(33,138,36,36);
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(77, 138, 36, 36)];
    [view2.layer setBorderWidth:0.8];
    number2.frame = CGRectMake(77,138,36,36);
    
    view3 = [[UIView alloc] initWithFrame:CGRectMake(121,138, 36, 36)];
    [view3.layer setBorderWidth:0.8];
    number3.frame = CGRectMake(121,138,36,36);
    
    view4 = [[UIView alloc] initWithFrame:CGRectMake(165, 138, 36, 36)];
    [view4.layer setBorderWidth:0.8];
    number4.frame = CGRectMake(165,138,36,36);
    
    view5 = [[UIView alloc] initWithFrame:CGRectMake(209, 138, 36, 36)];
    [view5.layer setBorderWidth:0.8];
    number5.frame = CGRectMake(209,138,36,36);
    
    view6 = [[UIView alloc] initWithFrame:CGRectMake(253, 138, 36, 36)];
    [view6.layer setBorderWidth:0.8];
    number6.frame = CGRectMake(253,138,36,36);
    
    view7 = [[UIView alloc] initWithFrame:CGRectMake(28, 178, 36, 36)];
    [view7.layer setBorderWidth:0.8];
    
    view8 = [[UIView alloc] initWithFrame:CGRectMake(72, 178, 36, 36)];
    [view8.layer setBorderWidth:0.8];
    
    view9 = [[UIView alloc] initWithFrame:CGRectMake(116, 178, 36, 36)];
    [view9.layer setBorderWidth:0.8];
    
    view10 = [[UIView alloc] initWithFrame:CGRectMake(170, 178, 36, 36)];
    [view10.layer setBorderWidth:0.8];
    
    view11 = [[UIView alloc] initWithFrame:CGRectMake(214, 178, 36, 36)];
    [view11.layer setBorderWidth:0.8];
    
    view12 = [[UIView alloc] initWithFrame:CGRectMake(258, 178, 36, 36)];
    [view12.layer setBorderWidth:0.8];
    
    view13 = [[UIView alloc] initWithFrame:CGRectMake(23, 218, 36, 36)];
    [view13.layer setBorderWidth:0.8];
    
    view14 = [[UIView alloc] initWithFrame:CGRectMake(67, 218, 36, 36)];
    [view14.layer setBorderWidth:0.8];
    
    view15 = [[UIView alloc] initWithFrame:CGRectMake(121, 218, 36, 36)];
    [view15.layer setBorderWidth:0.8];
    
    view16 = [[UIView alloc] initWithFrame:CGRectMake(165, 218, 36, 36)];
    [view16.layer setBorderWidth:0.8];
    
    view17 = [[UIView alloc] initWithFrame:CGRectMake(209, 218, 36, 36)];
    [view17.layer setBorderWidth:0.8];
    
    view18 = [[UIView alloc] initWithFrame:CGRectMake(263, 218, 36, 36)];
    [view18.layer setBorderWidth:0.8];
    
    view19 = [[UIView alloc] initWithFrame:CGRectMake(18, 258, 36, 36)];
    [view19.layer setBorderWidth:0.8];
    
    view20 = [[UIView alloc] initWithFrame:CGRectMake(72, 258, 36, 36)];
    [view20.layer setBorderWidth:0.8];
    
    view21 = [[UIView alloc] initWithFrame:CGRectMake(160, 258, 36, 36)];
    [view21.layer setBorderWidth:0.8];
    
    view22 = [[UIView alloc] initWithFrame:CGRectMake(214, 258, 36, 36)];
    [view22.layer setBorderWidth:0.8];
    
    view23 = [[UIView alloc] initWithFrame:CGRectMake(136, 230, 36, 36)];
    [view23.layer setBorderWidth:0.8];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    [self.view addSubview:view5];
    [self.view addSubview:view6];
    [self.view addSubview:view7];
    [self.view addSubview:view8];
    [self.view addSubview:view9];
    [self.view addSubview:view10];
    [self.view addSubview:view11];
    [self.view addSubview:view12];
    [self.view addSubview:view13];
    [self.view addSubview:view14];
    [self.view addSubview:view15];
    [self.view addSubview:view16];
    [self.view addSubview:view17];
    [self.view addSubview:view18];
    [self.view addSubview:view19];
    [self.view addSubview:view20];
    [self.view addSubview:view21];
    [self.view addSubview:view22];
    [self.view addSubview:view23];
    
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:number1.center] atIndex:0];
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:number2.center] atIndex:1];
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:number3.center] atIndex:2];
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:number4.center] atIndex:3];
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:number5.center] atIndex:4];
    [self.arrayOfObjectCenterCoordinate insertObject:[NSValue valueWithCGPoint:number6.center] atIndex:5];
    
    [self.arrayOfOldPoints insertObject:[NSValue valueWithCGPoint:number1.center] atIndex:0];
    [self.arrayOfOldPoints insertObject:[NSValue valueWithCGPoint:number2.center] atIndex:1];
    [self.arrayOfOldPoints insertObject:[NSValue valueWithCGPoint:number3.center] atIndex:2];
    [self.arrayOfOldPoints insertObject:[NSValue valueWithCGPoint:number4.center] atIndex:3];
    [self.arrayOfOldPoints insertObject:[NSValue valueWithCGPoint:number5.center] atIndex:4];
    [self.arrayOfOldPoints insertObject:[NSValue valueWithCGPoint:number6.center] atIndex:5];
    
    [number1 addTarget:self action:@selector(wasDragged:withEvent:)
     forControlEvents:UIControlEventTouchDragInside];
    
    [number1 addTarget:self action:@selector(wasDropped:withEvent:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [number2 addTarget:self action:@selector(wasDragged:withEvent:)
      forControlEvents:UIControlEventTouchDragInside];
    
    [number2 addTarget:self action:@selector(wasDropped:withEvent:)
      forControlEvents:UIControlEventTouchUpInside];
    
    [number3 addTarget:self action:@selector(wasDragged:withEvent:)
      forControlEvents:UIControlEventTouchDragInside];
    
    [number3 addTarget:self action:@selector(wasDropped:withEvent:)
      forControlEvents:UIControlEventTouchUpInside];
    
    [number4 addTarget:self action:@selector(wasDragged:withEvent:)
      forControlEvents:UIControlEventTouchDragInside];
    
    [number4 addTarget:self action:@selector(wasDropped:withEvent:)
      forControlEvents:UIControlEventTouchUpInside];
    
    [number5 addTarget:self action:@selector(wasDragged:withEvent:)
      forControlEvents:UIControlEventTouchDragInside];
    
    [number5 addTarget:self action:@selector(wasDropped:withEvent:)
      forControlEvents:UIControlEventTouchUpInside];
    
    [number6 addTarget:self action:@selector(wasDragged:withEvent:)
      forControlEvents:UIControlEventTouchDragInside];
    
    [number6 addTarget:self action:@selector(wasDropped:withEvent:)
      forControlEvents:UIControlEventTouchUpInside];
    
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:arc4random() % 100] atIndex:0];
    [number1 setTitle:[[self.arrayOfNumberObjects objectAtIndex:0] stringValue] forState:UIControlStateNormal];
    
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:arc4random() % 100] atIndex:1];
    [number2 setTitle:[[self.arrayOfNumberObjects objectAtIndex:1] stringValue] forState:UIControlStateNormal];
    
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:arc4random() % 100] atIndex:2];
    [number3 setTitle:[[self.arrayOfNumberObjects objectAtIndex:2] stringValue] forState:UIControlStateNormal];
    
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:arc4random() % 100] atIndex:3];
    [number4 setTitle:[[self.arrayOfNumberObjects objectAtIndex:3] stringValue] forState:UIControlStateNormal];
    
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:arc4random() % 100] atIndex:4];
    [number5 setTitle:[[self.arrayOfNumberObjects objectAtIndex:4] stringValue] forState:UIControlStateNormal];
    
    [self.arrayOfNumberObjects insertObject:[NSNumber numberWithInt:arc4random() % 100] atIndex:5];
    [number6 setTitle:[[self.arrayOfNumberObjects objectAtIndex:5] stringValue] forState:UIControlStateNormal];



    [self.view addSubview:number1];
    [self.view addSubview:number2];
    [self.view addSubview:number3];
    [self.view addSubview:number4];
    [self.view addSubview:number5];
    [self.view addSubview:number6];
    
        
    view7.hidden = YES;
    view8.hidden = YES;
    view9.hidden = YES;
    view10.hidden = YES;
    view11.hidden = YES;
    view12.hidden = YES;
    view13.hidden = YES;
    view14.hidden = YES;
    view15.hidden = YES;
    view16.hidden = YES;
    view17.hidden = YES;
    view18.hidden = YES;
    view19.hidden = YES;
    view20.hidden = YES;
    view21.hidden = YES;
    view22.hidden = YES;
    view23.hidden = YES;
    
    
    
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

    /*for (int index = 0; index < [self.arrayOfNumberObjects count]; index++) {
        NSLog(@"%d", [[self.arrayOfNumberObjects objectAtIndex:index] intValue]);
    }*/
}


- (void)wasDragged:(UIButton *)button withEvent:(UIEvent *)event{
    
    // get the touch
	UITouch *touch = [[event touchesForView:button] anyObject];
    
	// get delta
	CGPoint previousLocation = [touch previousLocationInView:button];
    NSLog(@"%f, %f", previousLocation.x,previousLocation.y);
	CGPoint location = [touch locationInView:button];
	CGFloat delta_x = location.x - previousLocation.x;
	CGFloat delta_y = location.y - previousLocation.y;
    
	// move button
    CGPoint newPointGen = CGPointMake(button.center.x + delta_x,
                                      button.center.y + delta_y);
    oldPoint = button.center;
    button.center = newPointGen;
}

- (void)wasDropped: (UIButton *)button withEvent: (UIEvent *)event{
    
 //make not hidden and found yes
    
    BOOL found = NO;
    if (!view1.hidden && CGRectContainsPoint(view1.frame, button.center)) {
        //do something
        //NSLog(@"Hello! How are You");
        found = YES;
        button.center = view1.center;
    }
    if (!view2.hidden && CGRectContainsPoint(view2.frame, button.center)) {
        //do something
        found = YES;
        button.center = view2.center;
        //NSLog(@"Hello!");
    }
    if (!view3.hidden && CGRectContainsPoint(view3.frame, button.center)) {
        //do something
        button.center = view3.center;
        found = YES;
    }
    if (!view4.hidden && CGRectContainsPoint(view4.frame, button.center)) {
        //do something
        button.center = view4.center;
        found = YES;
    }
    if (!view5.hidden && CGRectContainsPoint(view5.frame, button.center)) {
        //do something
        button.center = view5.center;
    }
    if (!view6.hidden && CGRectContainsPoint(view6.frame, button.center)) {
        //do something
        button.center = view6.center;
    }
    if (view7.hidden && CGRectContainsPoint(view7.frame, button.center)) {
        //do something
    }
    if (view8.hidden && CGRectContainsPoint(view8.frame, button.center)) {
        //do something
    }
    if (view9.hidden && CGRectContainsPoint(view9.frame, button.center)) {
        //do something
    }
    if (view10.hidden && CGRectContainsPoint(view10.frame, button.center)) {
        //do something
    }
    if (view11.hidden && CGRectContainsPoint(view11.frame, button.center)) {
        //do something
    }
    if (view12.hidden && CGRectContainsPoint(view12.frame, button.center)) {
        //do something
    }
    if (view13.hidden && CGRectContainsPoint(view13.frame, button.center)) {
        //do something
    }
    if (view14.hidden && CGRectContainsPoint(view14.frame, button.center)) {
        //do something
    }
    if (view15.hidden && CGRectContainsPoint(view15.frame, button.center)) {
        //do something
    }
    if (view16.hidden && CGRectContainsPoint(view16.frame, button.center)) {
        //do something
    }
    if (view17.hidden && CGRectContainsPoint(view17.frame, button.center)) {
        //do something
    }
    if (view18.hidden && CGRectContainsPoint(view18.frame, button.center)) {
        //do something
    }
    if (view19.hidden && CGRectContainsPoint(view19.frame, button.center)) {
        //do something
    }
    if (view20.hidden && CGRectContainsPoint(view20.frame, button.center)) {
        //do something
    }
    if (view21.hidden && CGRectContainsPoint(view21.frame, button.center)) {
        //do something
    }
    if (view22.hidden && CGRectContainsPoint(view22.frame, button.center)) {
        //do something
    }
    if (!view23.hidden && CGRectContainsPoint(view23.frame, button.center)) {
        //do something
        button.center = view23.center;
        found = YES;
    }
    
    if(!found){
        [self oldValues];
        //old
        //CGPoint= []
        //button.center = []
    }
}
- (IBAction)nextPass:(UIButton *)sender {
    //static int index = 0;
    //static int merge_index = 0;
    if ((self.index < self.arrayOfMovableObjects.count)) {
        while (1) {
            
            if ([[self.arrayOfMovableObjects objectAtIndex:self.index] isKindOfClass:[ObjectSwapConstraints class]]) {
                ObjectSwapConstraints  *objectSwapConstraints = [self.arrayOfMovableObjects objectAtIndex:self.index];
                NSLog(@"Swap: %d, %d, %d, %@", objectSwapConstraints.sourceIndex, objectSwapConstraints.destinationIndex, objectSwapConstraints.isSwapped,objectSwapConstraints.information);
                [self.arrayOfButtons exchangeObjectAtIndex:objectSwapConstraints.sourceIndex withObjectAtIndex:objectSwapConstraints.destinationIndex];
                //[self.arrayOfObjectCenterCoordinate exchangeObjectAtIndex:objectSwapConstraints.sourceIndex withObjectAtIndex:objectSwapConstraints.destinationIndex];
        
                //NSMutableArray *buttonCenterCoordinates = [[NSMutableArray alloc]init];
                NSMutableArray *buttonCenterCoordinates = [[NSMutableArray alloc]init];
                
                [buttonCenterCoordinates insertObject:number1 atIndex:0];
                [buttonCenterCoordinates insertObject:number1 atIndex:1];
                [buttonCenterCoordinates insertObject:number1 atIndex:2];
                [buttonCenterCoordinates insertObject:number1 atIndex:3];
                [buttonCenterCoordinates insertObject:number1 atIndex:4];
                [buttonCenterCoordinates insertObject:number1 atIndex:5];
                
                [buttonCenterCoordinates replaceObjectAtIndex:[self.arrayOfButtons indexOfObject:number1] withObject:[NSValue valueWithCGPoint:number1.center]];
                
                [buttonCenterCoordinates replaceObjectAtIndex:[self.arrayOfButtons indexOfObject:number2] withObject:[NSValue valueWithCGPoint:number2.center]];
                
                [buttonCenterCoordinates replaceObjectAtIndex:[self.arrayOfButtons indexOfObject:number3] withObject:[NSValue valueWithCGPoint:number3.center]];
                
                [buttonCenterCoordinates replaceObjectAtIndex:[self.arrayOfButtons indexOfObject:number4] withObject:[NSValue valueWithCGPoint:number4.center]];
                
                [buttonCenterCoordinates replaceObjectAtIndex:[self.arrayOfButtons indexOfObject:number5] withObject:[NSValue valueWithCGPoint:number5.center]];
                
                [buttonCenterCoordinates replaceObjectAtIndex:[self.arrayOfButtons indexOfObject:number6] withObject:[NSValue valueWithCGPoint:number6.center]];
                

                
               /* CGPoint point1 = [[self.arrayOfObjectCenterCoordinate objectAtIndex:0]CGPointValue];
                CGPoint point2 = [[self.arrayOfObjectCenterCoordinate objectAtIndex:1]CGPointValue];
                CGPoint point3 = [[self.arrayOfObjectCenterCoordinate objectAtIndex:2]CGPointValue];
                CGPoint point4 = [[self.arrayOfObjectCenterCoordinate objectAtIndex:3]CGPointValue];
                CGPoint point5 = [[self.arrayOfObjectCenterCoordinate objectAtIndex:4]CGPointValue];
                CGPoint point6 = [[self.arrayOfObjectCenterCoordinate objectAtIndex:5]CGPointValue];
                
                NSLog(@"number1: %f, %f", number1.center.x, point1.x);
                NSLog(@"number2: %f, %f", number2.center.x, point2.x);
                NSLog(@"number3: %f, %f", number3.center.x, point3.x);
                NSLog(@"number4: %f, %f", number4.center.x, point4.x);
                NSLog(@"number5: %f, %f", number5.center.x, point5.x);
                NSLog(@"number6: %f, %f", number6.center.x, point6.x);*/
                

                if ([self compareFirstMutableArray:self.arrayOfObjectCenterCoordinate withSecondMutableArray:buttonCenterCoordinates]) {
                    NSLog(@"you got it brother");
                    self.messageLabel.text = @"Right move😃";
                    self.score += 4;
                    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.score];
                    self.index++;
                    
                    [self.arrayOfOldPoints replaceObjectAtIndex:0 withObject:[NSValue valueWithCGPoint:number1.center]];
                    [self.arrayOfOldPoints replaceObjectAtIndex:0 withObject:[NSValue valueWithCGPoint:number1.center]];
                   [self.arrayOfOldPoints replaceObjectAtIndex:0 withObject:[NSValue valueWithCGPoint:number1.center]];
                    [self.arrayOfOldPoints replaceObjectAtIndex:0 withObject:[NSValue valueWithCGPoint:number1.center]];
                    [self.arrayOfOldPoints replaceObjectAtIndex:0 withObject:[NSValue valueWithCGPoint:number1.center]];
                    [self.arrayOfOldPoints replaceObjectAtIndex:0 withObject:[NSValue valueWithCGPoint:number1.center]];
                    
                }
                else{
                    self.messageLabel.text = @"Wrong move😞";
                    self.score -= 2;
                    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.score];
                    
                    [self oldValues];
                }
                
                break;
            }
            self.index++;
        }
        self.index++;
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: [NSString stringWithFormat:@" Your Score %d", self.score]
                              message: @"You can go back and try other algorithms"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    
}
- (IBAction)startGame:(UIButton *)sender {
    if ([self.sortType isEqualToString:@"Selection Sort"] || [self.sortType isEqualToString:@"Insertion Sort"] || [self.sortType isEqualToString:@"Bubble Sort"]) {
        NSLog(@"Hello");
        view23.hidden = NO;
    }
    else{
        view7.hidden = NO;
        view8.hidden = NO;
        view9.hidden = NO;
        view10.hidden = NO;
        view11.hidden = NO;
        view12.hidden = NO;
    }
    self.start.hidden = YES;
    self.next.hidden = NO;
}

- (BOOL)compareFirstMutableArray: (NSMutableArray *)firstArray withSecondMutableArray: (NSMutableArray *)secondArray{
    BOOL isEqual = YES;
    //NSLog(@"%f")
    for (int index = 0; index < [self.arrayOfObjectCenterCoordinate count]; index++) {
        CGPoint point1 = [[self.arrayOfObjectCenterCoordinate objectAtIndex:index] CGPointValue];
        CGPoint point2 = [[secondArray objectAtIndex:index] CGPointValue];
        NSLog(@"point1: %f, %f", point1.x, point2.x);
        //NSLog(@"point1: %f, %f", point2.x, point2.y);
        if (!CGPointEqualToPoint([[self.arrayOfObjectCenterCoordinate objectAtIndex:index] CGPointValue], [[secondArray objectAtIndex:index] CGPointValue])) {
            isEqual = NO;
            break;
        }
    }
    return isEqual;
}

- (void)oldValues{
    
    [UIView animateWithDuration:0.5 animations:^{
        number1.center = [[self.arrayOfOldPoints objectAtIndex:0] CGPointValue];
        number2.center = [[self.arrayOfOldPoints objectAtIndex:1] CGPointValue];
        number3.center = [[self.arrayOfOldPoints objectAtIndex:2] CGPointValue];
        number4.center = [[self.arrayOfOldPoints objectAtIndex:3] CGPointValue];
        number5.center = [[self.arrayOfOldPoints objectAtIndex:4] CGPointValue];
        number6.center = [[self.arrayOfOldPoints objectAtIndex:5] CGPointValue];
        
    } completion:^(BOOL finished) {
    }];
   
    
}
@end
