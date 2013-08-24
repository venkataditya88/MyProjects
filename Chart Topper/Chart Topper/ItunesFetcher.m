//
//  ItunesFetcher.m
//  Chart Topper
//
//  Created by Venkat Aditya Timmaraju on 3/17/13.
//  Copyright (c) 2013 CSUChico. All rights reserved.
//

#import "ItunesFetcher.h"
#import "NetworkActivityTracker.h"
@implementation ItunesFetcher

+(NSArray *) fetchITunesDetails:(NSString *)url{
    
    NSURL * contentUrl = [[NSURL alloc]initWithString:url];
    
    [[NetworkActivityTracker sharedInstance] showActivityIndicator];
    [NSThread sleepForTimeInterval:drand48() * 3.0];
    NSData *jsonContents = [[NSData alloc] initWithContentsOfURL:contentUrl];
    [[NetworkActivityTracker sharedInstance] hideActivityIndicator];
    if (jsonContents == NULL){
        return nil;
    }
    NSError *error;
    
    NSDictionary *parsedJSON = [NSJSONSerialization JSONObjectWithData:
                                jsonContents options:0 error:&error];
    
    if (error){
        NSLog(@"error in parsing JSON String");
        return NULL;
    }
    
    if (parsedJSON == nil){
        return nil;
    }
    NSMutableArray *categoryArray = [[NSMutableArray alloc]init];
    parsedJSON = [parsedJSON valueForKey:@"feed"];
    parsedJSON = [parsedJSON objectForKey:@"entry"];
    NSEnumerator *enumerator = [parsedJSON objectEnumerator];
    id value;
    int rank = 0;
    while ((value = [enumerator nextObject])){
        ItunesMediaItem *itunesMediaItem = [[ItunesMediaItem alloc]init];
        [categoryArray addObject: [itunesMediaItem initWithJSONAttributes:value rank:++rank]];
    }
    return categoryArray;
}
+ (NSArray *) topFreeApps{

    return [self fetchITunesDetails:@"https://itunes.apple.com/us/rss/topfreeapplications/limit=50/json"];
}

+ (NSArray *) topAlbums{

    return [self fetchITunesDetails:@"https://itunes.apple.com/us/rss/topalbums/limit=50/json"];
    
}

+ (NSArray *) topMovies{

    
    return [self fetchITunesDetails:@"https://itunes.apple.com/us/rss/topmovies/limit=50/json"];
}

+ (NSArray *) topPaidBooks{

    return [self fetchITunesDetails:@"https://itunes.apple.com/us/rss/toppaidebooks/limit=50/json"];
}

+ (NSArray *) topTVEpisodes{
    
    return [self fetchITunesDetails:@"https://itunes.apple.com/us/rss/toppaidebooks/limit=50/json"];
}

+ (NSArray *) topITunesUCourses{

    return [self fetchITunesDetails:@"https://itunes.apple.com/us/rss/topitunesucourses/limit=50/json"];
    
}


@end
