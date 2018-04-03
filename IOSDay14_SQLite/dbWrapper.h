//
//  dbWrapper.h
//  IOSDay14_SQLite
//
//  Created by Student-003 on 29/03/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface dbWrapper : NSObject
{

    sqlite3 *taskDatabase;

}
-(NSString *)getDatabasePath;
-(BOOL)executeQuery:(NSString *)query;
-(void)getAllTask:(NSString *)query;
-(void)createTable;
+(instancetype)getSharedObject;
@property NSMutableArray *tNameArray;
@property NSMutableArray *tIDArray;

@end
