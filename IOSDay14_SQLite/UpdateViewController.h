//
//  UpdateViewController.h
//  IOSDay14_SQLite
//
//  Created by Student-003 on 02/04/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbWrapper.h"

@interface UpdateViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtID;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
- (IBAction)btnUpdate:(id)sender;
- (IBAction)btnCancel:(id)sender;

@end
