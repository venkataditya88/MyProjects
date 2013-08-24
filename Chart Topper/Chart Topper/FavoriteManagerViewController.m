//
//  FavoriteManagerViewController.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 4/18/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "FavoriteManagerViewController.h"
#import "FavouriteManager.h"
@interface FavoriteManagerViewController ()

@end

@implementation FavoriteManagerViewController
static NSString *dirPath;

- (void)viewDidAppear:(BOOL)animated{
    self.items = [[FavouriteManager sharedFavoritesManager]allFavorites];
    [self.tableView reloadData];
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[FavouriteManager sharedFavoritesManager] removeFavorite:self.items[indexPath.row]];
        self.items = [[FavouriteManager sharedFavoritesManager] allFavorites];
        if (dirPath == nil){
            dirPath = [self returnDirPath];
        }
        NSString *dataPath = [dirPath stringByAppendingPathComponent:@"Data.plist"];
        [NSKeyedArchiver archiveRootObject:[[FavouriteManager sharedFavoritesManager] allFavorites] toFile:dataPath];
        [self.tableView reloadData];
    }
}

- (NSString *) returnDirPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"Private_Documents"];
    
    NSError *error;
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    
    return documentsDirectory;
    
}
@end
