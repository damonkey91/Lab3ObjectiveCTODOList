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
@property (nonatomic) NSMutableArray *finishedList;
@property (nonatomic) NSUserDefaults *defaults;
@end

NSString* const KEY_TODO = @"todo";
NSString* const KEY_DESCRIPTION = @"description";
NSString* const KEY_TODOLIST = @"todolist";
NSString* const KEY_FINISHEDLIST = @"finishedlist";
@implementation TableModule

-(instancetype)init{
    self = [super init];
    if (self) {
        self.defaults = [NSUserDefaults standardUserDefaults];
        
        if ([self.defaults objectForKey:KEY_TODOLIST]) {
            self.todoList = [NSMutableArray arrayWithArray: [self.defaults objectForKey:KEY_TODOLIST]];
        }else
            self.todoList = [[NSMutableArray alloc] init];
        
        if ([self.defaults objectForKey:KEY_FINISHEDLIST]) {
            self.finishedList = [NSMutableArray arrayWithArray: [self.defaults objectForKey:KEY_FINISHEDLIST]];
        }else
            self.finishedList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)saveTodo:(NSString*) title description:(NSString*)text inSection:(int)section row:(int)row if:(BOOL)condition{
    
    if (condition) {
        if (section == 0) {
            
            [self.todoList replaceObjectAtIndex:row withObject:@{KEY_TODO:title, KEY_DESCRIPTION:text}];
        }else
            [self.finishedList replaceObjectAtIndex:row withObject:@{KEY_TODO:title, KEY_DESCRIPTION:text}];
    }else
        [self.todoList addObject:@{KEY_TODO:title, KEY_DESCRIPTION:text}];
    [self nsuserSave];
}

-(int)getSections{
    return 2;
}

-(int)getRowsForSection:(int)section{
    if (section == 0) {
        return self.todoList.count;
    }else
        return self.finishedList.count;
    
}

-(NSString*)getTodoTitle:(int) row fromSection:(int)section{
    if (section == 0) {
        return [self.todoList[row] valueForKey:KEY_TODO];
    }else
        return [self.finishedList[row] valueForKey:KEY_TODO];
}

-(NSString*)getDescriptionFromRow:(int)row Section:(int)section{
    if (section == 0) {
        return [self.todoList[row] valueForKey:KEY_DESCRIPTION];
    }else
        return [self.finishedList[row] valueForKey:KEY_DESCRIPTION];
}

-(void)changeSection:(int)section row:(int)row{
    
    if (section == 0) {
        [self.finishedList addObject: self.todoList[row]];
        [self.todoList removeObjectAtIndex:row];
    } else{
        [self.todoList addObject: self.finishedList[row]];
        [self.finishedList removeObjectAtIndex:row];
    }
    [self nsuserSave];
}

-(void)nsuserSave{
    [self.defaults setObject:self.todoList forKey:KEY_TODOLIST];
    [self.defaults setObject:self.finishedList forKey:KEY_FINISHEDLIST];
}

@end

//extra viktig
//klicka på en todo kunna redigera
