//
//  UpdateViewController.m
//  IOSDay14_SQLite
//
//  Created by Student-003 on 02/04/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)btnUpdate:(id)sender
{
    
    NSString *updateQuery=[NSString stringWithFormat:@"update  taskTable set taskName='%@' where taskID='%@'",self.txtName.text,self.txtID.text];
    BOOL isSuccessful=[[dbWrapper getSharedObject]executeQuery:updateQuery];
    if (isSuccessful)
    {
        NSLog(@"Update: Success");
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Update: Failed");
    }
    
}

- (IBAction)btnCancel:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
