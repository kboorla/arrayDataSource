//
//  AutomobileTableViewCell.m
//  AbstractTableView
//
//  Created by Khechar Boorla on 9/29/16.
//  Copyright © 2016 Khechar Boorla. All rights reserved.
//

#import "AutomobileTableViewCell.h"

@implementation AutomobileTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(TableViewCellConfigureBlock) configureForItem:(id) item {
    TableViewCellConfigureBlock configureCellBlock;
    if ( [item isKindOfClass:[Automobiles class]] ) {
        configureCellBlock = ^(AutomobileTableViewCell * cell, Automobiles *car) {
            cell.Make.text = car.Make;
            cell.Model.text = car.Model;
            cell.Color.text = car.Color;
        };
    }
    if ( [item isKindOfClass:[Drivers class]] ) {
        configureCellBlock = ^(AutomobileTableViewCell * cell, Drivers *driver) {
            cell.Make.text = driver.Name;
            cell.Model.text = driver.Type;
            cell.Color.text = @" ";
        };
    }
    return configureCellBlock;
}

@end
