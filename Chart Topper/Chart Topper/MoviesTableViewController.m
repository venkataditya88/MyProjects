//
//  MoviesTableViewController.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/20/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "MoviesTableViewController.h"
#import "ItunesFetcher.h"
@interface MoviesTableViewController ()

@end

@implementation MoviesTableViewController

- (NSArray *)fetchMediaItems{
    return [ItunesFetcher topMovies];
}

@end
