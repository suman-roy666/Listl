//
//  AddAlbumViewController.h
//  The LP Archive
//
//  Created by Suman Roy on 20/11/15.
//  Copyright (c) 2015 sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAlbumViewController : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *albumNameField;
@property (weak, nonatomic) IBOutlet UITextField *albumArtistField;
@property (weak, nonatomic) IBOutlet UITextField *albumYearField;
@property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumArtistLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumYearLabel;
@property (weak, nonatomic) IBOutlet UIImageView *albumArt;

- (IBAction)albumNameFieldValueChanged:(id)sender;

- (IBAction)addAlbumArt:(id)sender;

- (IBAction)albumArtistFieldValueChanged:(id)sender;
- (IBAction)albumYearFieldValueChanged:(id)sender;


- (IBAction)cancelAddAlbum:(id)sender;
- (IBAction)saveAlbumData:(id)sender;

@end
