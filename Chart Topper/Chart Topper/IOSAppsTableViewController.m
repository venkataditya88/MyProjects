//
//  IOSAppsTableViewController.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/17/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "IOSAppsTableViewController.h"
#import "ItunesFetcher.h"
@interface IOSAppsTableViewController ()


@end

@implementation IOSAppsTableViewController


- (NSArray *)fetchMediaItems{
    return [ItunesFetcher topFreeApps];
}

/*- (void)refresh{
    [self.refreshData startRe]
}*/

@end
