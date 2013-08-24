//
//  FavouriteManager.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 4/13/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "FavouriteManager.h"

@interface FavouriteManager()

@property (strong,nonatomic)  NSMutableSet *allItem;
@end

@implementation FavouriteManager

- (NSMutableSet *) allItem{
    if (!_allItem) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        NSString *directory_path = [paths objectAtIndex:0];
        directory_path = [ directory_path stringByAppendingPathComponent:@"Private_Documents"];
        NSString *dataPath = [directory_path stringByAppendingPathComponent:@"Data.plist"];
        NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:dataPath];
        
        _allItem = [[NSMutableSet alloc]initWithArray:array];
        
    }
    
    return _allItem;
}

- (void)addFavorite:(ItunesMediaItem *)mediaItem{

    [[FavouriteManager sharedFavoritesManager].allItem addObject:mediaItem];
    
}

- (void)removeFavorite:(ItunesMediaItem *)mediaItem{
    [[FavouriteManager sharedFavoritesManager].allItem removeObject:mediaItem];
}

- (BOOL)isFavorite:(ItunesMediaItem *)mediaItem{
    
    return [[[FavouriteManager sharedFavoritesManager] allFavorites] containsObject:mediaItem];
}

- (NSArray *)allFavorites{
    return [[FavouriteManager sharedFavoritesManager].allItem allObjects];
}

+ (FavouriteManager *)sharedFavoritesManager{
    static FavouriteManager *favourite_Manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        favourite_Manager = [[FavouriteManager alloc] init];
    });
    return favourite_Manager;
}



@end
