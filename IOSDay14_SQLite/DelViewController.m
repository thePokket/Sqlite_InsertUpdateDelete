//
//  DelViewController.m
//  IOSDay14_SQLite
//
//  Created by Student-003 on 30/03/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import "DelViewController.h"

@interface DelViewController ()

@end

@implementation DelViewController

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

- (IBAction)delBut:(id)sender
{
    
    
        NSString *deleteQuery=[NSString stringWithFormat:@"delete from taskTable where taskName='%@'",self.searchBar.text];
         BOOL isSuccessful=[[dbWrapper getSharedObject]executeQuery:deleteQuery];
        if (isSuccessful)
        {
            NSLog(@"Delete: Success");
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            NSLog(@"Delete: Failed");
        }
        
    

    
}

- (IBAction)delAll:(id)sender
{
    
    
    NSString *deleteAllQuery=[NSString stringWithFormat:@"delete from taskTable"];
    BOOL isSuccessful=[[dbWrapper getSharedObject]executeQuery:deleteAllQuery];
    if (isSuccessful)
    {
        NSLog(@"Delete: Success");
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Delete: Failed");
    }
    
}
@end
