//
//  FavouriteManager.h
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 4/13/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItunesMediaItem.h"

@interface FavouriteManager : NSObject
- (void)addFavorite:(ItunesMediaItem *)mediaItem;
- (void)removeFavorite:(ItunesMediaItem *)mediaItem;
- (BOOL)isFavorite:(ItunesMediaItem *)mediaItem;

- (NSArray *)allFavorites;

+ (FavouriteManager *)sharedFavoritesManager;


@end
