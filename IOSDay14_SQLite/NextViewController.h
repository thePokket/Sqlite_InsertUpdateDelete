//
//  NextViewController.h
//  IOSDay14_SQLite
//
//  Created by Student-003 on 29/03/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbWrapper.h"

@interface NextViewController : UIViewController
- (IBAction)saveButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *idtext;
@property (strong, nonatomic) IBOutlet UITextField *nameText;


@end
