//
//  DataController.m
//  The LP Archive
//
//  Created by Suman Roy on 20/11/15.
//  Copyright (c) 2015 sourcebits. All rights reserved.
//

#import "DataController.h"

@implementation DataController


static NSString *albumDataFilePath;
static NSString *albumDataFileName = @"AlbumData.plist";

+(void) prepareDocumentDirectory{
    
    NSFileManager *fileManager = [ NSFileManager defaultManager ];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    albumDataFilePath = [ documentsPath stringByAppendingPathComponent:albumDataFileName ] ;
    
    
    
    if ( [fileManager fileExistsAtPath:albumDataFilePath] ) {
        
        NSLog(@"File Exists at Path\n %@",albumDataFilePath );
        //NSArray *dataArray = [NSArray arrayWithContentsOfFile:albumDataFilePath ];
        
    } else {
        
        NSString *filePathInBundle = [[NSBundle mainBundle] pathForResource:@"Album_List" ofType:@"plist"];
        
        
        NSData *fileBuffer = [ NSData dataWithContentsOfFile:filePathInBundle ];
        
        [ fileManager createFileAtPath:albumDataFilePath contents:fileBuffer attributes:nil ];
        
    }

    
}

+ (NSArray*)getAlbumList{
    
    NSArray *fileData = [ NSArray arrayWithContentsOfFile:albumDataFilePath ];
    
    NSMutableArray *albumNames = [[ NSMutableArray alloc] init];
    
    for (NSDictionary *album in fileData) {
        
        [ albumNames addObject: [ album valueForKey:@"Name" ] ];
        
    }
    
    return [ NSArray arrayWithArray:albumNames ];
}

+ (Album *)getAlbumDetailsFor:(NSString *)albumName{
    
    NSArray *fileData = [ NSArray arrayWithContentsOfFile:albumDataFilePath ];
    
    NSPredicate *albumSearchPredicate = [ NSPredicate predicateWithFormat:@"( Name == %@ )",albumName ];
    
    NSDictionary *album = [[ fileData filteredArrayUsingPredicate:albumSearchPredicate ] objectAtIndex:0 ];
    
    Album *albumData = [[ Album alloc ] init];
    
    albumData.albumName = [ album valueForKey:@"Name" ];
    albumData.albumArtist = [ album valueForKey:@"Artist" ];
    albumData.albumYear = [ album valueForKey:@"Year" ];
    albumData.albumArt = [ album valueForKey:@"Art" ];
    
    return albumData;
}

+(void)addAlbum: (Album*)album {
    
    NSDictionary *albumDictionary = [ NSDictionary dictionaryWithObjectsAndKeys: album.albumName,@"Name",
                                     album.albumArtist, @"Artist",
                                     album.albumYear, @"Year",
                                     album.albumArt,@"Art",
                                     nil ];
    
    NSMutableArray *fileData = [ NSMutableArray arrayWithContentsOfFile:albumDataFilePath ];
    
    if (fileData == nil ) {
        
        fileData = [ NSMutableArray arrayWithObjects:albumDictionary, nil ];
    } else {
    
        [ fileData addObject:albumDictionary ];
    }

    //NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    //albumDataFilePath = [ documentsPath stringByAppendingPathComponent:albumDataFileName ] ;
    
    [ fileData writeToFile:albumDataFilePath atomically:YES ];
    
}

+(void)removeAlbum:(Album*) album{
    
    NSMutableArray *fileData = [ NSMutableArray arrayWithContentsOfFile:albumDataFilePath ];
    
    NSPredicate *albumSearchPredicate = [ NSPredicate predicateWithFormat:@"( Name == %@ )",album.albumName ];
    
    NSArray *markedAlbums = [ fileData filteredArrayUsingPredicate:albumSearchPredicate ];

    [ fileData removeObjectsInArray:markedAlbums ];
    
    [ fileData writeToFile:albumDataFilePath atomically:YES ];
    
}

@end
