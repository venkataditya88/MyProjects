//
//  PhotoGridViewController.m
//  PhotoPicker
//
//  Created by Venkat Aditya Timmaraju on 2/25/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "PhotoGridViewController.h"
#import "PhotoLibrary.h"
#import "PhotoCategoryResuableView.h"
#import "PhotoCollectionViewCell.h"

@interface PhotoGridViewController ()  <UICollectionViewDataSource, UICollectionViewDelegate>
@property(nonatomic) PhotoLibrary *photoLibrary;
@property (weak, nonatomic) IBOutlet UILabel *nameOfImage;

@end

@implementation PhotoGridViewController



- (PhotoLibrary *) photoLibrary{
    
    if (!_photoLibrary) _photoLibrary = [[PhotoLibrary alloc]init];
    
    return _photoLibrary;
}


- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return [self.photoLibrary numberOfPhotosInCategory:section];
    
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.photoLibrary numberOfCategories];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"imageInCategory" forIndexPath:indexPath];
    
    cell.imageDisplay.image = [self.photoLibrary imageForPhotoInCategory:indexPath.section atPosition:indexPath.row];
    return cell;
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    PhotoCategoryResuableView *view = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"category" forIndexPath:indexPath];
    
    view.labelDisplay.text = [self.photoLibrary nameForCategory:indexPath.section];
    
    return view;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.nameOfImage.text = [self.photoLibrary nameForPhotoInCategory:indexPath.section atPosition:indexPath.row];
    
}



- (void) viewDidLoad{
    [super viewDidLoad];
    self.nameOfImage.text = @"Tap An Image";
}
- (void)viewWillDisappear:(BOOL)animated{
    self.nameOfImage.text = @"Tap An Image";
}


@end
