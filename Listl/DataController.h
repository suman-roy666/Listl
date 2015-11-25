//
//  DataController.h
//  The LP Archive
//
//  Created by Suman Roy on 20/11/15.
//  Copyright (c) 2015 sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface DataController : NSObject

@property (strong) NSArray *dataArray;

//-(id)init __attribute__((unavailable("Must use initWithType: instead.")));

+(void) prepareDocumentDirectory;

+(NSArray*)getAlbumList;

+(Album*)getAlbumDetailsFor: (NSString*)albumName;

+(void)addAlbum: (Album*)album;

+(void)removeAlbum:(Album*) album;

@end
