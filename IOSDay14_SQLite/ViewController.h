//
//  ViewController.h
//  IOSDay14_SQLite
//
//  Created by Student-003 on 29/03/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextViewController.h"
#import "dbWrapper.h"
#import "DelViewController.h"
#import "UpdateViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)addBar:(id)sender;
- (IBAction)trashBar:(id)sender;
- (IBAction)btnUpdate:(id)sender;

@property NSArray *taskArray;
@property NSArray *taskIdArray;

@end

