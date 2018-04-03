//
//  ViewController.m
//  IOSDay14_SQLite
//
//  Created by Student-003 on 29/03/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    NSString *selectQuery=@"select taskId,taskName from taskTable";
    [[dbWrapper getSharedObject]getAllTask:selectQuery];
    NSLog(@"All Task Names: %@",[dbWrapper getSharedObject].tNameArray);
    NSLog(@"All Task IDs: %@",[dbWrapper getSharedObject].tIDArray);
    if([dbWrapper getSharedObject].tNameArray.count>0)
    {
        self.taskIdArray=[dbWrapper getSharedObject].tIDArray;
        self.taskArray=[dbWrapper getSharedObject].tNameArray;
        self.myTableView.delegate=self;
        self.myTableView.dataSource=self;
    }
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSString *selectQuery=@"select taskId,taskName from taskTable";
    [[dbWrapper getSharedObject]getAllTask:selectQuery];
    NSLog(@"All Task Names: %@",[dbWrapper getSharedObject].tNameArray);
    NSLog(@"All Task Names: %@",[dbWrapper getSharedObject].tIDArray);
    if([dbWrapper getSharedObject].tNameArray.count>0)
    {
        self.taskArray=[dbWrapper getSharedObject].tNameArray;
        self.taskIdArray=[dbWrapper getSharedObject].tIDArray;
        [self.myTableView reloadData];
    }
    else if([dbWrapper getSharedObject].tNameArray.count==0)
    {
        self.taskArray=[dbWrapper getSharedObject].tNameArray;
        self.taskIdArray=[dbWrapper getSharedObject].tIDArray;
        [self.myTableView reloadData];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.taskArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[self.taskIdArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addBar:(id)sender
{
    
    NextViewController *nvc=[self.storyboard instantiateViewControllerWithIdentifier:@"NextViewController"];
    [self.navigationController pushViewController:nvc animated:YES];
    
}

- (IBAction)trashBar:(id)sender
{
    
    DelViewController *dvc=[self.storyboard instantiateViewControllerWithIdentifier:@"DelViewController"];
    [self.navigationController pushViewController:dvc animated:YES];
    
}

- (IBAction)btnUpdate:(id)sender
{
    
    UpdateViewController *upc=[self.storyboard instantiateViewControllerWithIdentifier:@"UpdateViewController"];
    [self.navigationController pushViewController:upc animated:YES];
    
}

@end
