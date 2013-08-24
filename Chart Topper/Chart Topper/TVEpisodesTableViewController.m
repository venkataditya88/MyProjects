//
//  TVEpisodesTableViewController.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/20/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "TVEpisodesTableViewController.h"
#import "ItunesFetcher.h"
@interface TVEpisodesTableViewController ()

@end

@implementation TVEpisodesTableViewController

- (NSArray *)fetchMediaItems{
    return [ItunesFetcher topTVEpisodes];
}


@end
