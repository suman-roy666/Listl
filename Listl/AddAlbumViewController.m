//
//  AddAlbumViewController.m
//  The LP Archive
//
//  Created by Suman Roy on 20/11/15.
//  Copyright (c) 2015 sourcebits. All rights reserved.
//

#import "AddAlbumViewController.h"
#import "Album.h"
#import "DataController.h"

@interface AddAlbumViewController ()

@end

@implementation AddAlbumViewController{
    
    Album *albumToAdd;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    albumToAdd = [[ Album alloc] init];
    
    [ self.albumArtistField setBorderStyle: UITextBorderStyleRoundedRect ];
    [ self.albumNameField setBorderStyle: UITextBorderStyleRoundedRect ];
    [ self.albumYearField setBorderStyle: UITextBorderStyleRoundedRect ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)albumNameFieldValueChanged:(id)sender {
    
    if ( ![ self.albumNameField.text isEqualToString:@"" ]) {
        [ self.albumNameLabel setHidden:NO ];
        [ self.albumNameField setPlaceholder:nil ];
    } else {
        
        [ self.albumNameLabel setHidden:YES ];
        [ self.albumNameField setPlaceholder:@"Album Name" ];
    }
    
}

- (IBAction)addAlbumArt:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: nil
                                                             delegate: self
                                                    cancelButtonTitle: @"Cancel"
                                               destructiveButtonTitle: nil
                                                    otherButtonTitles: @"Add Album Art", nil];
    [actionSheet showInView:self.view];
}

- (IBAction)albumArtistFieldValueChanged:(id)sender{
    
    if ( ![ self.albumArtistField.text isEqualToString:@"" ]) {
        [ self.albumArtistLabel setHidden:NO ];
        [ self.albumArtistField setPlaceholder:nil ];
    } else {
        
        [ self.albumArtistLabel setHidden:YES ];
        [ self.albumArtistField setPlaceholder:@"Album Artist" ];
    }
    
}

- (IBAction)albumYearFieldValueChanged:(id)sender{
    
    if ( ![ self.albumYearField.text isEqualToString:@"" ]) {
        [ self.albumYearLabel setHidden:NO ];
        [ self.albumYearField setPlaceholder:nil ];
    } else {
        
        [ self.albumYearLabel setHidden:YES ];
        [ self.albumYearField setPlaceholder:@"Release Year" ];
    }
}


- (IBAction)cancelAddAlbum:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveAlbumData:(id)sender {
    
    albumToAdd.albumName = self.albumNameField.text;
    albumToAdd.albumArtist = self.albumArtistField.text;
    albumToAdd.albumYear = self.albumYearField.text;
    
    [ DataController addAlbum:albumToAdd ];
    [ self.navigationController popViewControllerAnimated:YES ];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        
        case 0:
            [self choosePhotoFromExistingImages];
        default:
            break;
    }
}

-(void)choosePhotoFromExistingImages
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypePhotoLibrary];
        controller.delegate = self;
        [self.navigationController presentViewController: controller animated: YES completion: nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.navigationController dismissViewControllerAnimated: YES completion: nil];
    UIImage *image = [info valueForKey: UIImagePickerControllerOriginalImage];
    
    self.albumArt.image = image;
    
    albumToAdd.albumArt = [ info valueForKey:UIImagePickerControllerMediaURL ];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
{
    [self.navigationController dismissViewControllerAnimated: YES completion: nil];
}

@end
