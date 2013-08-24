//
//  ItunesMediaItemDetailViewController.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/18/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "ItunesMediaItemDetailViewController.h"
#import "TFHpple.h"
#import "FavouriteManager.h"
#define PADDING 16.0
#define FRAME_WIDTH 256.0
@interface ItunesMediaItemDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemTitle;
@property (weak, nonatomic) IBOutlet UILabel *itemArtist;
@property (weak, nonatomic) IBOutlet UITableViewCell *itemRankDetail;
@property (weak, nonatomic) IBOutlet UILabel *inAppPurchase;
@property (weak, nonatomic) IBOutlet UITableViewCell *itemCategoryDetail;
@property (weak, nonatomic) IBOutlet UITableViewCell *itemDetail;

@property (weak, nonatomic) IBOutlet UITableViewCell *itemSummary;
@property (weak, nonatomic) IBOutlet UITextView *itemSummaryText;
@property (weak, nonatomic) IBOutlet UIButton *itemPrice;
@property (weak, nonatomic) IBOutlet UITableViewCell *itemReleaseDateDetail;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *imageLoad;
@property (weak, nonatomic) IBOutlet UIButton *favourite;

@end

@implementation ItunesMediaItemDetailViewController
static NSString* dirPath;

- (void) setMediaItem:(ItunesMediaItem *)mediaItem{
    _mediaItem = mediaItem;
}
- (void) viewDidLoad{
    self.itemImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageLoad startAnimating];
    dispatch_queue_t imageFetchQ = dispatch_queue_create(" image fetcher", NULL);
    dispatch_async(imageFetchQ, ^{
        UIImage *image = self.mediaItem.artworkImage;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.itemImage.image = image;
            [self.imageLoad stopAnimating];
            
        });
    });
    self.itemTitle.text = self.mediaItem.title;
    self.itemArtist.text = self.mediaItem.artist;
    self.itemRankDetail.detailTextLabel.text = [NSString stringWithFormat:@"%d",self.mediaItem.rank];
    self.itemCategoryDetail.detailTextLabel.text = self.mediaItem.category;
    self.itemReleaseDateDetail.detailTextLabel.text = self.mediaItem.releaseDate;
    [self.itemPrice setTitle:self.mediaItem.price forState:UIControlStateNormal];
    

    if (self.mediaItem.summary == NULL){
        self.itemSummary.hidden= YES;
    }
    else{
        CGRect frame = self.itemSummaryText.frame;
        frame.size.height = self.itemSummaryText.contentSize.height;
        self.itemSummaryText.frame = CGRectMake(0.0, 0.0, FRAME_WIDTH, frame.size.height);
        self.itemSummaryText.text = self.mediaItem.summary;
    }
    self.itemDetail.backgroundColor = nil;
    NSURL *url = self.mediaItem.storeURL;
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    if ([[FavouriteManager sharedFavoritesManager] isFavorite:self.mediaItem]){
        [self.favourite setSelected:YES];
    }
    else{
        [self.favourite setSelected:NO];
    }
    
    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:data];
    
    NSString *tutorialsXpathQueryString = @"//div[@class='extra-list in-app-purchases']";
    
    NSArray *tutorialsNodes = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString];
    if (tutorialsNodes.count > 0){
        self.inAppPurchase.text = @"This App Offers In-App Purchase";
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return self.itemSummaryText.contentSize.height + PADDING;
    }else {
        return [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
}

- (IBAction)itemBuy:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:self.mediaItem.storeURL];

}
- (IBAction)shareButton:(UIBarButtonItem *)sender {
    NSArray *activityItems = [NSArray arrayWithObjects: self.mediaItem.storeURL , self.itemImage.image ,nil];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    
    [self presentViewController:activityVC animated:YES completion:nil];
}
- (IBAction)favouriteItem:(UIButton *)sender {
    
    if ([[FavouriteManager sharedFavoritesManager] isFavorite:self.mediaItem]){
        [[FavouriteManager sharedFavoritesManager] removeFavorite:self.mediaItem];
        [self.favourite setSelected:NO];
    }
    else{
        [[FavouriteManager sharedFavoritesManager] addFavorite:self.mediaItem];
        [self.favourite setSelected:YES];
    }
    if (dirPath == nil){
        dirPath = [self returnDirPath];
    }
    NSString *dataPath = [dirPath stringByAppendingPathComponent:@"Data.plist"];
    [NSKeyedArchiver archiveRootObject:[[FavouriteManager sharedFavoritesManager] allFavorites] toFile:dataPath];
}

- (NSString *) returnDirPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"Private_Documents"];
    
    NSError *error;
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    
    return documentsDirectory;
    
}


- (void)viewDidDisappear:(BOOL)animated{
    
    [self.view removeFromSuperview];
    self.view = nil;
}

@end
