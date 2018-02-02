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
NSString* const KEY_IMPORTANT = @"important";

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
        NSMutableArray *array = [self chooseArrayFromSection:section];
        [array replaceObjectAtIndex:row withObject:@{KEY_TODO:title, KEY_DESCRIPTION:text, KEY_IMPORTANT:@0}];
    }else
        [self.todoList addObject:@{KEY_TODO:title, KEY_DESCRIPTION:text, KEY_IMPORTANT:@0}];
    [self nsuserSave];
}

-(int)getSections{
    return 2;
}

-(int)getRowsForSection:(int)section{
    NSMutableArray *array = [self chooseArrayFromSection:section];
    return array.count;
}

-(NSString*)getTodoTitle:(int) row fromSection:(int)section{
    NSMutableArray *array = [self chooseArrayFromSection:section];
    return [array[row] valueForKey:KEY_TODO];
}

-(NSString*)getDescriptionFromRow:(int)row Section:(int)section{
    NSMutableArray *array = [self chooseArrayFromSection:section];
    return [array[row] valueForKey:KEY_DESCRIPTION];
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

-(void)setImportantForSection:(int)section Row:(int)row{
    NSMutableArray *array = [self chooseArrayFromSection:section];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict addEntriesFromDictionary: array[row]];
        if ([[array[row] valueForKey:KEY_IMPORTANT] boolValue]) {
            [dict setObject:@0 forKey:KEY_IMPORTANT];
        }else{
            [dict setObject:@1 forKey:KEY_IMPORTANT];
        }
    [array replaceObjectAtIndex:row withObject:dict];
    [self nsuserSave];
}

-(BOOL)getImportantForSection:(int)section Row:(int)row{
    NSMutableArray *array = [self chooseArrayFromSection:section];
        return [[array[row] valueForKey:KEY_IMPORTANT] boolValue];
}

-(NSMutableArray*)chooseArrayFromSection:(int)section{
    if (section == 0) {
        return self.todoList;
    }else
        return self.finishedList;
}
@end

//Ändra knappar till touch och swipe
