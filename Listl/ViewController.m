//
//  ViewController.m
//  Listl
//
//  Created by Suman Roy on 18/11/15.
//  Copyright (c) 2015 sourcebits. All rights reserved.
//

#import "ViewController.h"
#import "AlbumViewController.h"
#import "AlbumListTableViewCell.h"
#import "AddAlbumViewController.h"
#import "DataController.h"

@interface ViewController ()

@end

@implementation ViewController{
    
    NSArray *albumNameArray;
    NSInteger selectedRow;
}

NSString *albumListCellIdentifier = @"AlbumListTableViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [ self.albumListTable registerNib:[ UINib nibWithNibName:albumListCellIdentifier
                                                      bundle:nil]
               forCellReuseIdentifier:albumListCellIdentifier ];
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    albumNameArray = [ DataController getAlbumList ];
    
    [ self.albumListTable reloadData ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AlbumListTableViewCell *cell = [ self.albumListTable dequeueReusableCellWithIdentifier:albumListCellIdentifier ];
    
    cell.albumNameLabel.text = [ albumNameArray objectAtIndex:indexPath.row  ];
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [ albumNameArray count ];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    selectedRow = indexPath.row;
    [ self performSegueWithIdentifier:@"ShowAlbum" sender:self ];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ( [segue.identifier isEqualToString:@"ShowAlbum" ]) {
        AlbumViewController *destinationView = (AlbumViewController*)segue.destinationViewController;
        
        destinationView.albumOnDisplay = [ DataController getAlbumDetailsFor:[ albumNameArray objectAtIndex: selectedRow ]];         
    }
    
}

@end
