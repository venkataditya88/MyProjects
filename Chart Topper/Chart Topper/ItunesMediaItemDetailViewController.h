//
//  ItunesMediaItemDetailViewController.h
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/18/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItunesMediaItem.h"

@interface ItunesMediaItemDetailViewController : UITableViewController <UITableViewDelegate>
@property (nonatomic, strong) ItunesMediaItem *mediaItem;
@end
