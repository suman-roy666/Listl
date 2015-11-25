//
//  AlbumViewController.h
//  Listl
//
//  Created by Suman Roy on 18/11/15.
//  Copyright (c) 2015 sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface AlbumViewController : UIViewController

@property Album *albumOnDisplay;

@property (weak, nonatomic) IBOutlet UIImageView *albumArtImageView;
@property (weak, nonatomic) IBOutlet UILabel *albumTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumArtistLabel;

- (IBAction)deleteAlbumButtonHandler:(id)sender;
@end
