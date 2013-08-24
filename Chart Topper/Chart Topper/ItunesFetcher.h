//
//  ItunesFetcher.h
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/17/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItunesMediaItem.h"
@interface ItunesFetcher : NSObject
+ (NSArray *)topFreeApps;
+ (NSArray *)topAlbums;
+ (NSArray *)topPaidBooks;
+ (NSArray *)topMovies;
+ (NSArray *)topTVEpisodes;
+ (NSArray *)topITunesUCourses;
@end
