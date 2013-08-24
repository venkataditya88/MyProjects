//
//  ItunesMediaItem.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/17/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "ItunesMediaItem.h"
#import "NetworkActivityTracker.h"
#define DEFAULT_IMAGE @"DefaultArtwork.png"
@implementation ItunesMediaItem

@synthesize artworkImage;

- (UIImage *)artworkImage{
    if (!artworkImage){
        if (!_artworkURL){
            artworkImage = [UIImage imageNamed:DEFAULT_IMAGE];
        }
        else{
            [[NetworkActivityTracker sharedInstance] showActivityIndicator];
            [NSThread sleepForTimeInterval:drand48() * 3.0];
            NSData *imageData = [[NSData alloc]initWithContentsOfURL:_artworkURL];
            [[NetworkActivityTracker sharedInstance] hideActivityIndicator];
            if (imageData != NULL){
                UIImage *image = [UIImage imageWithData:imageData];
                artworkImage = image;
            }
            else{
                artworkImage = [UIImage imageNamed:DEFAULT_IMAGE];
            }
        }
        return artworkImage;
    }
    else{
        return artworkImage;
    }
}
-(id) initWithJSONAttributes:(NSDictionary *)jsonAttributes rank:(int)rank{
    


     _title = jsonAttributes[@"im:name"][@"label"];
    
    _artist = jsonAttributes[@"im:artist"][@"label"];

    
    _category =  jsonAttributes[@"category"][@"attributes"][@"label"];

    
    _releaseDate = jsonAttributes[@"im:releaseDate"][@"attributes"][@"label"];

    
    _price = jsonAttributes[@"im:price"][@"label"];

    
    _summary = jsonAttributes[@"summary"][@"label"];

    
    NSEnumerator *enumerator;
    id value;
    
    _artworkURL = [NSURL URLWithString:[[[jsonAttributes objectForKey:@"im:image"] objectAtIndex:2]objectForKey:@"label"]];
    
    enumerator = [jsonAttributes[@"link"] objectEnumerator];
    while ((value = [enumerator nextObject])){

        if ([value[@"attributes"][@"type"] isEqualToString:@"text/html"]){
            _storeURL = [[NSURL alloc] initWithString:value[@"attributes"][@"href"]];

        }
        else if ([value[@"type"] isEqualToString:@"text/html"]){
            _storeURL = [[NSURL alloc]initWithString:value[@"href"]];

        }
    }
    _rank = rank;
    return self;
}

- (BOOL)isEqual:(ItunesMediaItem *)other {
    return [[self storeURL] isEqual:[other storeURL]];
}

- (NSUInteger) hash{
    return [[self storeURL] hash];
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:_title forKey:@"Title"];
    [coder encodeObject:_artist forKey:@"Artist"];
    [coder encodeObject:_category forKey:@"Category"];
    [coder encodeObject:_releaseDate forKey:@"ReleaseDate"];
    [coder encodeObject:_price forKey:@"Price"];
    [coder encodeObject:_summary forKey:@"Summary"];
    [coder encodeObject:_artworkURL forKey:@"ArtworkURL"];
    [coder encodeObject:_storeURL forKey:@"StoreURL"];
    [coder encodeInteger:_rank forKey:@"Rank"];
    
}

- (id)initWithCoder:(NSCoder *)decoder{
    _title = [decoder decodeObjectForKey:@"Title"];
    _artist = [decoder decodeObjectForKey:@"Artist"];
    _category = [decoder decodeObjectForKey:@"Category"];
    _releaseDate = [decoder decodeObjectForKey:@"ReleaseDate"];
    _price = [decoder decodeObjectForKey:@"Price"];
    _summary = [decoder decodeObjectForKey:@"Summary"];
    _artworkURL = [decoder decodeObjectForKey:@"ArtworkURL"];
    _storeURL = [decoder decodeObjectForKey:@"StoreURL"];
    _rank = [decoder decodeIntegerForKey:@"Rank"];
    return self;
}

@end
