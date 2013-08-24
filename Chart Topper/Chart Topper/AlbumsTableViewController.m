//
//  AlbumsTableViewController.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/20/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "AlbumsTableViewController.h"
#import "ItunesFetcher.h"
@interface AlbumsTableViewController ()

@end

@implementation AlbumsTableViewController



- (NSArray *)fetchMediaItems{
    return [ItunesFetcher topAlbums];
}

@end
