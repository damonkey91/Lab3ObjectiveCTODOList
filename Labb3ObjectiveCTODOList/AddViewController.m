//
//  AddViewController.m
//  Labb3ObjectiveCTODOList
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import "AddViewController.h"
#import "TableModule.h"

@interface AddViewController ()


@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.oldTodo) {
        self.titleTextView.text = [self.tableModule getTodoTitle:self.row fromSection:self.section];
        self.descriptionTextView.text = [self.tableModule getDescriptionFromRow:self.row Section:self.section];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
    [self.tableModule saveTodo:self.titleTextView.text description:self.descriptionTextView.text inSection:self.section row:self.row if:self.oldTodo];
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
