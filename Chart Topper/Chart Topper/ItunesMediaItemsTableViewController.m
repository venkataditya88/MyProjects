//
//  ItunesMediaItemsTableViewController.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/17/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "ItunesMediaItemsTableViewController.h"
#import "ItunesMediaItem.h"
#import "ItunesMediaItemsTableViewCell.h"
@interface ItunesMediaItemsTableViewController ()

@end

@implementation ItunesMediaItemsTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    dispatch_queue_t loaderQ = dispatch_queue_create("MediaItem latest loader", NULL);
    dispatch_async(loaderQ, ^{
        NSArray *mediaItems = [self fetchMediaItems];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.items = mediaItems;
        });
    });
    
    [self.refreshControl addTarget:self
                            action:@selector(refresh)
                  forControlEvents:UIControlEventValueChanged];
}

- (NSArray *)fetchMediaItems{
    return @[];
}

- (void) refresh{
    
    [self.refreshControl beginRefreshing];
    dispatch_queue_t loaderQ = dispatch_queue_create("apps latest loader", NULL);
    dispatch_async(loaderQ, ^{
        NSArray *latestItems = [self fetchMediaItems];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.items = latestItems;
            [self.refreshControl endRefreshing];
        });
    });
}
- (void)setItems:(NSArray *)items
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Network Error"
                          message: @"A Network Connection cannot be Detected.Please Make Sure that you have an active internet connection and try again"
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    _items = items;
    if (self.items == nil){
        [alert show];
    }
    else{
        _items = items;
    }
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([sender isKindOfClass:[ItunesMediaItemsTableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            
            if ([segue.identifier isEqualToString:@"Show Details"]) {
                
                if ([segue.destinationViewController respondsToSelector:@selector(setMediaItem:)]){
                    ItunesMediaItem *mediaItem = self.items[indexPath.row];
                    [segue.destinationViewController setTitle:mediaItem.title];
                    [segue.destinationViewController performSelector:@selector(setMediaItem:) withObject:mediaItem];
                    
                }
            }
        }
    }
    
}

- (NSString *)titleForRow:(NSUInteger)row
{
    ItunesMediaItem *mediaItem = self.items[row];
    return mediaItem.title; 
}



- (NSString *)subtitleForRow:(NSUInteger)row
{
    
    ItunesMediaItem *mediaItem = self.items[row];
    return mediaItem.artist;
}

- (NSString *) rankForRow: (NSUInteger)row{
    ItunesMediaItem *mediaItem = self.items[row];
    return [NSString stringWithFormat:@"#%d",mediaItem.rank];
    
}

- (UIImage *) imageForApp: (NSUInteger) row{
    ItunesMediaItem *mediaItem = self.items[row];
    return mediaItem.artworkImage;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    ItunesMediaItemsTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"Media Items" forIndexPath:indexPath];
    

    tableViewCell.itemTitle.text = [self titleForRow:indexPath.row];
    tableViewCell.itemSubtitle.text = [self subtitleForRow:indexPath.row];
    tableViewCell.itemRank.text = [self rankForRow:indexPath.row];
    tableViewCell.appImage.contentMode = UIViewContentModeScaleAspectFit;
    
        [tableViewCell.imageLoad startAnimating];
        tableViewCell.appImage.image = NULL;
        dispatch_queue_t imageFetchQ = dispatch_queue_create("app Image fetcher", NULL);
        dispatch_async(imageFetchQ, ^{
                UIImage *image = [self imageForApp:indexPath.row];
                dispatch_async(dispatch_get_main_queue(), ^{
                    ItunesMediaItemsTableViewCell *cell = (ItunesMediaItemsTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
                    cell.appImage.image = image;
                    [cell.imageLoad stopAnimating];
                    
                });
        });
    return tableViewCell;
}



@end
