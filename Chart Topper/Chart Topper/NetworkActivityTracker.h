//
//  NetworkActivityTracker.h
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 4/6/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkActivityTracker : NSObject
+ (NetworkActivityTracker *)sharedInstance;

- (void)showActivityIndicator;
- (void)hideActivityIndicator;

@end
