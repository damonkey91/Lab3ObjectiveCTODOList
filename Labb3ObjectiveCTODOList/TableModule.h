//
//  tableModule.h
//  Labb3ObjectiveCTODOList
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableModule : NSObject
-(void)saveTodo:(NSString*) title description:(NSString*)text;
-(int)getSections;
-(int)getRows;
-(NSString*)getTodoTitle:(int) row;
@end
