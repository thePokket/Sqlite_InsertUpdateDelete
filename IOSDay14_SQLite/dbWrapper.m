//
//  dbWrapper.m
//  IOSDay14_SQLite
//
//  Created by Student-003 on 29/03/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import "dbWrapper.h"

@implementation dbWrapper
+(instancetype)getSharedObject
{

    static dbWrapper *object;
    if(object==nil)
    {
        object=[[dbWrapper alloc]init];
    }
    return object;
    
}

-(NSString *)getDatabasePath
{
    NSArray *docDir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbPath=[[docDir firstObject] stringByAppendingString:@"/myDb.sqlite"];
    return dbPath;
}

-(BOOL)executeQuery:(NSString *)query
{

    BOOL success=NO;
    sqlite3_stmt *stmt=NULL;
    const char *CQuery=[query UTF8String];
    const char *databasePath=[[self getDatabasePath] UTF8String];
    if(sqlite3_open(databasePath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase, CQuery,-1,&stmt,nil)==SQLITE_OK)
        {
            if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                success=YES;
                sqlite3_close(taskDatabase);
                sqlite3_finalize(stmt);
            }
             NSLog(@"Error in Prepare %s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            NSLog(@"Error in Prepare %s",sqlite3_errmsg(taskDatabase));
        }
    }
    else
    {
        NSLog(@"Error in Opening Database %s",sqlite3_errmsg(taskDatabase));
    }
    
    return success;
    
}

-(void)createTable
{
    
    NSString *createQuery=@"create table if not exists taskTable(taskId text,taskName text)";
    BOOL isSuccess=[self executeQuery:createQuery];
    if(isSuccess)
    {
        NSLog(@"Table Is Create");
    }
    else
    {
        NSLog(@"Table Not Created");
    }
    
}

-(void)getAllTask:(NSString *)query
{

    sqlite3_stmt *stmt=NULL;
    self.tNameArray=[[NSMutableArray alloc]init];
    self.tIDArray=[[NSMutableArray alloc]init];
    const char *CQuery=[query UTF8String];
    const char *databasePath=[[self getDatabasePath] UTF8String];
    if(sqlite3_open(databasePath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase, CQuery,-1,&stmt,nil)==SQLITE_OK)
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                const unsigned char *taskID= sqlite3_column_text(stmt,0);
                const unsigned char *taskName= sqlite3_column_text(stmt,1);
                NSString *tName=[NSString stringWithFormat:@"%s",taskName];
                 NSString *tID=[NSString stringWithFormat:@"%s",taskID];
                [self.tIDArray addObject:tID];
                [self.tNameArray addObject:tName];
                
            }
            if(self.tNameArray.count>0)
            {
                sqlite3_close(taskDatabase);
                sqlite3_finalize(stmt);
                NSLog(@"%@",self.tIDArray);
                NSLog(@"%@",self.tNameArray);
            }
            else
            {
                NSLog(@"Database Not Contains Records %s",sqlite3_errmsg(taskDatabase));
            }
        }
        else
        {
            NSLog(@"Error in Prepare %s",sqlite3_errmsg(taskDatabase));
        }
    }
    else
    {
        NSLog(@"Error in Opening Database %s",sqlite3_errmsg(taskDatabase));
    }
    
}

@end
