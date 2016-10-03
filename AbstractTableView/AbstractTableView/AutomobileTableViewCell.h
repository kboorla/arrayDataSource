//
//  AutomobileTableViewCell.h
//  AbstractTableView
//
//  Created by Khechar Boorla on 9/29/16.
//  Copyright © 2016 Khechar Boorla. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Automobiles.h"
#import "Drivers.h"

@interface AutomobileTableViewCell : UITableViewCell <hasConfigureForItem>

@property (weak, nonatomic) IBOutlet UILabel *Make;
@property (weak, nonatomic) IBOutlet UILabel *Model;
@property (weak, nonatomic) IBOutlet UILabel *Color;

-(TableViewCellConfigureBlock) configureForItem:(id) item;

@end
