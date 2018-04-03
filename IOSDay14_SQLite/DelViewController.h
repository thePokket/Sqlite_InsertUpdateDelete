//
//  DelViewController.h
//  IOSDay14_SQLite
//
//  Created by Student-003 on 30/03/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbWrapper.h"

@interface DelViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *searchBar;

- (IBAction)delBut:(id)sender;
- (IBAction)delAll:(id)sender;


@end
