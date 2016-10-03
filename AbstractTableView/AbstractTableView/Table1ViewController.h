//
//  Table1ViewController.h
//  AbstractTableView
//
//  Created by Khechar Boorla on 9/29/16.
//  Copyright © 2016 Khechar Boorla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArrayDataSource.h"
#import "Automobiles.h"
#import "Drivers.h"

@interface Table1ViewController : UIViewController

@property (nonatomic, strong) NSString *tableViewType;
@property (weak, nonatomic) IBOutlet UITableView *tableView1;

@end
