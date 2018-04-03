//
//  NextViewController.m
//  IOSDay14_SQLite
//
//  Created by Student-003 on 29/03/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

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

- (IBAction)saveButton:(id)sender
{
    
    NSString *insertQuery=[NSString stringWithFormat:@"insert into tasktable(taskID,taskName) values ('%@','%@')",self.idtext.text,self.nameText.text];
    BOOL isSuccess=[[dbWrapper getSharedObject]executeQuery:insertQuery];
    if(isSuccess)
    {
        NSLog(@"insert: Success");
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Insert: Failed");
    }
    
}
@end
