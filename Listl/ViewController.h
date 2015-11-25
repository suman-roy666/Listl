//
//  ViewController.h
//  Listl
//
//  Created by Suman Roy on 18/11/15.
//  Copyright (c) 2015 sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController < UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *albumListTable;

@end

