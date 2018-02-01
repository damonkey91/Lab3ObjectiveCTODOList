//
//  tableModule.h
//  Labb3ObjectiveCTODOList
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableModule : NSObject
-(void)saveTodo:(NSString*) title description:(NSString*)text inSection:(int)section row:(int)row if:(BOOL)condition;
-(int)getSections;
-(int)getRowsForSection:(int)section;
-(NSString*)getTodoTitle:(int) row fromSection:(int)section;
-(void)changeSection:(int)section row:(int)row;
-(NSString*)getDescriptionFromRow:(int)row Section:(int)section;
@end
