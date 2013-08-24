//
//  BooksTableViewController.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/20/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "BooksTableViewController.h"
#import "ItunesFetcher.h"
@interface BooksTableViewController ()

@end

@implementation BooksTableViewController


- (NSArray *)fetchMediaItems{
    return [ItunesFetcher topPaidBooks];
}

@end
