//
//  TodoListTableViewController.m
//  Labb3ObjectiveCTODOList
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import "TodoListTableViewController.h"
#import "TableModule.h"
#import "AddViewController.h"
#import "CustomTableViewCell.h"

@interface TodoListTableViewController ()
@property (nonatomic) TableModule *tableModule;
@end

@implementation TodoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableModule = [[TableModule alloc] init];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.tableModule getSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableModule getRowsForSection:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"tableIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [self.tableModule getTodoTitle:indexPath.row fromSection:indexPath.section];
    cell.row = indexPath.row;
    cell.section = indexPath.section;
    cell.tableModule = self.tableModule;
    cell.tableView = self.tableView;
    
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    AddViewController *controller = [segue destinationViewController];
    controller.tableModule = self.tableModule;
    if ([segue.identifier isEqualToString: @"detailSegue"]) {
        CustomTableViewCell *cell = sender;
        controller.oldTodo = YES;
        controller.section = cell.section;
        controller.row = cell.row;
    }
}


@end
