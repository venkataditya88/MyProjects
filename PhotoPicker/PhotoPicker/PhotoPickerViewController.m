//
//  PhotoPickerViewController.m
//  PhotoPicker
//
//  Created by Venkat Aditya Timmaraju on 2/25/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "PhotoPickerViewController.h"
#import "PhotoLibrary.h"
#define CATEGORY_COMPONENT 0
#define IMAGEINCATEGORY_COMPONENT 1
#define NUMBER_OF_COMPONENT 2
@interface PhotoPickerViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageDisplay;
@property (nonatomic) PhotoLibrary *photoLibrary;
@property (weak, nonatomic) IBOutlet UIPickerView *photosPicker;
@end

@implementation PhotoPickerViewController
- (IBAction)sliderDragged:(UISlider *)sender {
    
    self.imageDisplay.alpha = sender.value;
}

- (PhotoLibrary *) photoLibrary{
    
    if (!_photoLibrary) _photoLibrary = [[PhotoLibrary alloc]init];
    
    return _photoLibrary;
}


- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)photosPicker{
    
    return NUMBER_OF_COMPONENT;

}


- (NSInteger) pickerView:(UIPickerView *)photosPicker numberOfRowsInComponent:(NSInteger)component{
    
    if (component == CATEGORY_COMPONENT){
        
        return [self.photoLibrary numberOfCategories];
    }
    else if (component == IMAGEINCATEGORY_COMPONENT){
        return [self.photoLibrary numberOfPhotosInCategory:[self.photosPicker selectedRowInComponent:0]];
    }
    return 0;
}

- (void)pickerView:(UIPickerView *)photosPicker didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == CATEGORY_COMPONENT){
        [photosPicker reloadComponent:IMAGEINCATEGORY_COMPONENT];
        [photosPicker selectRow:0 inComponent:1 animated:YES];
        self.imageDisplay.image = [self.photoLibrary imageForPhotoInCategory:[self.photosPicker selectedRowInComponent:0] atPosition:0];
    }
    else if (component == IMAGEINCATEGORY_COMPONENT){
        self.imageDisplay.image = [self.photoLibrary imageForPhotoInCategory:[self.photosPicker selectedRowInComponent:0] atPosition:row];
    }
    

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == CATEGORY_COMPONENT){
        return [self.photoLibrary nameForCategory:row];
    }
    else if(component == IMAGEINCATEGORY_COMPONENT){
        return [self.photoLibrary nameForPhotoInCategory:[self.photosPicker selectedRowInComponent:0] atPosition:row];
    }
    else{
        return @"";
    }
}

-(void) viewDidLoad{
    
    [super viewDidLoad];
    [self.photosPicker selectRow:0 inComponent:0 animated:YES];
    [self.photosPicker selectRow:0 inComponent:1 animated:YES];
    self.imageDisplay.image = [self.photoLibrary imageForPhotoInCategory:0 atPosition:0];

}
- (void)viewWillDisappear:(BOOL)animated{
    [self.photosPicker selectRow:0 inComponent:0 animated:YES];
    [self.photosPicker selectRow:0 inComponent:1 animated:YES];
    self.imageDisplay.image = [self.photoLibrary imageForPhotoInCategory:0 atPosition:0];
}

@end
