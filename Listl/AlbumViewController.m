//
//  AlbumViewController.m
//  Listl
//
//  Created by Suman Roy on 18/11/15.
//  Copyright (c) 2015 sourcebits. All rights reserved.
//

#import "AlbumViewController.h"
#import "DataController.h"

@interface AlbumViewController ()

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.albumTitleLabel.text = [self.albumOnDisplay albumName];
    self.albumArtistLabel.text = [ self.albumOnDisplay albumArtist];
    self.albumYearLabel.text = [ NSString stringWithFormat:@"%@",[ self.albumOnDisplay albumYear ] ];
    [ self.albumArtImageView setImage:
     [ UIImage imageNamed:
      [ self.albumOnDisplay albumArt]] ];
    
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

- (IBAction)deleteAlbumButtonHandler:(id)sender {
    
    UIAlertController *deleteConfirm = [ UIAlertController alertControllerWithTitle:@"Deletion Confirmation"
                                                                            message:@""
                                                                     preferredStyle:UIAlertControllerStyleAlert ];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action){
                                                             
                                                             NSLog(@"Cancel action");
                                                         }];
    
    
    UIAlertAction *button = [UIAlertAction actionWithTitle:@"Delete"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action){
                                                       
                                                       [DataController removeAlbum: self.albumOnDisplay ];
                                                       
                                                       [ self.navigationController popViewControllerAnimated:YES ];
                                                   }];

    
    NSMutableAttributedString *hogan = [[NSMutableAttributedString alloc] initWithString:@"Delete This Album?"];
    
    [hogan addAttribute:NSFontAttributeName
                  value:[UIFont fontWithName:@"KohinoorDevanagari-Book" size:20.0f]
                  range:NSMakeRange(0, hogan.string.length - 1 )];
    
    [deleteConfirm setValue:hogan forKey:@"attributedTitle"];
    
    
    
    
    [deleteConfirm addAction:cancelAction];
    [deleteConfirm addAction:button];
    //UIView * firstView = deleteConfirm.view.subviews.firstObject;
    //UIView * nextView = firstView.subviews.firstObject;
    
    [ self presentViewController:deleteConfirm animated:YES completion:nil ];
    
    //nextView.backgroundColor = [UIColor colorWithRed:65 green:65 blue:65 alpha:1];
    
    deleteConfirm.view.layer.cornerRadius = 5;
    
    //deleteConfirm.view.tintColor = [ UIColor blackColor ];
    
}
@end
