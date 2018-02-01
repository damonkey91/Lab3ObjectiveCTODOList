//
//  AddViewController.h
//  Labb3ObjectiveCTODOList
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableModule.h"

@interface AddViewController : UIViewController
@property (nonatomic) TableModule *tableModule;
@property (weak, nonatomic) IBOutlet UITextField *titleTextView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (nonatomic) BOOL oldTodo;
@property (nonatomic) int section;
@property (nonatomic) int row;
@end
