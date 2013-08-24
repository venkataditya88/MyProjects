//
//  PhotoLibrary.m
//  PhotoPicker
//
//  Created by Venkat Aditya Timmaraju on 2/25/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "PhotoLibrary.h"

@implementation PhotoLibrary

NSDictionary *photoList;
NSDictionary *photosListOfCategory;
NSArray *sortedCatgeory;
NSArray *sortedPhotosInCategory;

- (NSUInteger)numberOfCategories{

    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"photo" ofType:@"plist"];
    photoList = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *categoryArray = [photoList allKeys];
    sortedCatgeory = [categoryArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    return [sortedCatgeory count];
    
}
- (NSString *)nameForCategory:(NSUInteger)category{
    
    return [sortedCatgeory  objectAtIndex:category];

}
- (NSUInteger)numberOfPhotosInCategory:(NSUInteger)category{
    
    photosListOfCategory = [NSDictionary dictionaryWithDictionary:[photoList objectForKey:[sortedCatgeory objectAtIndex:category]]];
    NSArray *photosInCategory = [photosListOfCategory  allKeys];
    sortedPhotosInCategory = [photosInCategory sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    return [sortedPhotosInCategory count];
    
}
- (NSString *)nameForPhotoInCategory:(NSUInteger)category
                          atPosition:(NSUInteger)position{
    NSDictionary *dictionary = [NSDictionary dictionaryWithDictionary:[photoList objectForKey:[sortedCatgeory objectAtIndex:category]]];
    NSArray *sortedKey = [[dictionary allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    return [sortedKey objectAtIndex:position];
    
}
- (UIImage *)imageForPhotoInCategory:(NSUInteger)category
                          atPosition:(NSUInteger)position{
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithDictionary:[photoList objectForKey:[sortedCatgeory objectAtIndex:category]]];
    NSArray *sortedKey = [[dictionary allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
     UIImage *image = [ UIImage imageNamed:[dictionary valueForKey:[sortedKey objectAtIndex:position ]]];
    return image;
}


@end
