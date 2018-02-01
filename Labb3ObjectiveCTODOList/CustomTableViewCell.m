//
//  CustomTableViewCell.m
//  Labb3ObjectiveCTODOList
//
//  Created by lösen är 0000 on 2018-02-01.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import "CustomTableViewCell.h"


@interface CustomTableViewCell()

@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //self.button.backgroundColor = [UIColor redColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    self.button.backgroundColor = [UIColor redColor];
}

- (IBAction)buttonClicked:(id)sender {
    [self.tableModule changeSection:self.section row:self.row];
    [self.tableView reloadData];
}

@end
