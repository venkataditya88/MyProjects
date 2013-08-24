//
//  ItunesMediaItemsTableViewCell.h
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/17/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItunesMediaItemsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *itemTitle;
@property (weak, nonatomic) IBOutlet UILabel *itemSubtitle;

@property (weak, nonatomic) IBOutlet UILabel *itemRank;

@property (weak, nonatomic) IBOutlet UIImageView *appImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *imageLoad;

@end
