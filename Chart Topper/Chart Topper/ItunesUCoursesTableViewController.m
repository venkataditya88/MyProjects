//
//  ItunesUCoursesTableViewController.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/20/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "ItunesUCoursesTableViewController.h"
#import "ItunesFetcher.h"
@interface ItunesUCoursesTableViewController ()

@end

@implementation ItunesUCoursesTableViewController

- (NSArray *)fetchMediaItems{
    return [ItunesFetcher topITunesUCourses];
}


@end
