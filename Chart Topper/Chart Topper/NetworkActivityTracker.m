//
//  NetworkActivityTracker.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 4/6/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "NetworkActivityTracker.h"

@implementation NetworkActivityTracker
int netwrokActivityCounter;
+ (NetworkActivityTracker *)sharedInstance
{
    static NetworkActivityTracker *sharedInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NetworkActivityTracker alloc] init];
    });
    
    return sharedInstance;
}

- (void) showActivityIndicator{
    if (!netwrokActivityCounter){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    }
    netwrokActivityCounter++;
}

- (void) hideActivityIndicator{
    netwrokActivityCounter--;
    if (!netwrokActivityCounter){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
}
@end
