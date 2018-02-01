//
//  CustomTableViewCell.h
//  Labb3ObjectiveCTODOList
//
//  Created by lösen är 0000 on 2018-02-01.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableModule.h"

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic) int row;
@property (nonatomic) int section;
@property (nonatomic) TableModule *tableModule;
@property (nonatomic) UITableView *tableView;

@end
