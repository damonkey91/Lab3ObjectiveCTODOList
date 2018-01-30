//
//  tableModule.m
//  Labb3ObjectiveCTODOList
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import "TableModule.h"

@interface TableModule ()
@property (nonatomic) NSMutableArray *todoList;
@end
NSString* const KEY_TODO = @"todo";
NSString* const KEY_DESCRIPTION = @"description";
@implementation TableModule

-(instancetype)init{
    self = [super init];
    if (self) {
        self.todoList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)saveTodo:(NSString*) title description:(NSString*)text{
    [self.todoList addObject:@{KEY_TODO:title, KEY_DESCRIPTION:text}];
}

-(int)getSections{
    return 1;
}

-(int)getRows{
    return self.todoList.count;
}

-(NSString*)getTodoTitle:(int) row{
    return [self.todoList[row] valueForKey:KEY_TODO];
}


@end
