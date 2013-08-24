//
//  ItunesMediaItem.h
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/17/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItunesMediaItem : NSObject<NSCoding>

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *category;
@property (nonatomic, readonly) NSString *artist;
@property (nonatomic, readonly) NSString *releaseDate;
@property (nonatomic, readonly) NSString *price;
@property (nonatomic, readonly) NSURL    *artworkURL;
@property (nonatomic, readonly) UIImage  *artworkImage;
@property (nonatomic, readonly) NSURL    *storeURL;
@property (nonatomic, readonly) NSString *summary;
@property (nonatomic, readonly) int       rank;

- (id)initWithJSONAttributes:(NSDictionary *)jsonAttributes
                        rank:(int)rank;
@end
