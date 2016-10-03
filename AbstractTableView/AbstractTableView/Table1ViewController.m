//
//  Table1ViewController.m
//  AbstractTableView
//
//  Created by Khechar Boorla on 9/29/16.
//  Copyright © 2016 Khechar Boorla. All rights reserved.
//

#import "Table1ViewController.h"

@interface Table1ViewController () {
    NSMutableArray *automobiles;
    ArrayDataSource *arrayDataSource;
    TableViewSearchConfigureBlock configureSearchBlock;
    
    NSMutableArray *drivers;
    TableViewSearchConfigureBlock driversConfigureSearch;
    
    NSMutableArray *mixed;
}
@end

@implementation Table1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    
    if ([self.tableViewType isEqualToString:@"CustomCell"]) {
        [self setupTableViewWithCustomCell:automobiles];
    }
    else if ([self.tableViewType isEqualToString:@"Default_Autos"]) {
        [self setupTableViewWithDefaultCellStyle:automobiles];
    }
    else if ([self.tableViewType isEqualToString:@"Default_Drivers"]) {
        [self setupTableViewWithDefaultCellStyle:drivers];
    }
    else if ([self.tableViewType isEqualToString:@"Subtitle_Autos"]) {
        [self setupTableViewWithUndefinedCell:automobiles];
    }
    else if ([self.tableViewType isEqualToString:@"Default_Mixed"]) {
        [self setupTableViewWithUndefinedCell:mixed];
    }
    else if ([self.tableViewType isEqualToString:@"Custom_Mixed"]) {
        [self setupTableViewWithCustomCell:mixed];
    }
    
    _tableView1.dataSource = arrayDataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupTableViewWithCustomCell:(NSArray *) items {
    configureSearchBlock = [Automobiles configureSearchForDefaultPicker];
    arrayDataSource = [[ArrayDataSource alloc] initWithItems:items
                                                              tableView:_tableView1
                                                             customCell:@"AutomobileTableViewCell"
                                                   configureSearchBlock:configureSearchBlock];
}

- (void) setupTableViewWithDefaultCellStyle:(NSArray *) items{
    configureSearchBlock = [Automobiles configureSearchForDefaultPicker];
    arrayDataSource = [[ArrayDataSource alloc] initWithItems:items
                                                              cellStyle:UITableViewCellStyleDefault
                                                         cellIdentifier:@"autoDefault"
                                                   configureSearchBlock:configureSearchBlock];
}

- (void) setupTableViewWithUndefinedCell:(NSArray *) items {
    configureSearchBlock = [Automobiles configureSearchForDefaultPicker];
    arrayDataSource = [[ArrayDataSource alloc] initWithItems:items
                                                              cellStyle:UITableViewCellStyleSubtitle
                                                         cellIdentifier:@"autoDefault"
                                                   configureSearchBlock:configureSearchBlock];
}

- (void) setupData {
    automobiles = [[NSMutableArray alloc] init];
    drivers = [[NSMutableArray alloc] init];
    mixed = [[NSMutableArray alloc] init];
    
    NSString * ma = @"ma";
    NSString * mo = @"mo";
    
    for (int i = 0; i < 2000; i++) {
        Automobiles *car = [[Automobiles alloc] init];
        
        switch (i % 5) {
            case 0 :  car[ma] = [@"Ford " stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
                break;
            case 1 :  car[ma] = [@"Toyota " stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
                break;
            case 2 :  car[ma] = [@"VolksWagon " stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
                break;
            case 3 :  car[ma] = [@"Rolls Royce " stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
                break;
            case 4 :  car[ma] = [@"KIA " stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
                break;
        }
        
        switch (i % 3) {
            case 0 :  car[mo] = @"Lemon";
                break;
            case 1 :  car[mo] = @"Klunker";
                break;
            case 2 :  car[mo] = @"Jalopy";
                break;
        }
        
        switch (i % 4) {
            case 0 : car.Color = @"Green";
                break;
            case 1 : car.Color = @"Blue";
                break;
            case 2 : car.Color = @"Red";
                break;
            case 3 : car.Color = @"White";
                break;
                
        }
        
        [automobiles addObject:car];
    
        Drivers *driver = [[Drivers alloc] init];
        
        switch (i % 5) {
            case 0 :  driver.Name = [@"Joe " stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
                break;
            case 1 :  driver.Name = [@"Sarah " stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
                break;
            case 2 :  driver.Name = [@"Angie " stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
                break;
            case 3 :  driver.Name = [@"Bill " stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
                break;
            case 4 :  driver.Name = [@"CoolKid " stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
                break;
        }
        
        switch (i % 3) {
            case 0 :  driver.Type = @"Truck";
                break;
            case 1 :  driver.Type = @"Car";
                break;
            case 2 :  driver.Type = @"Dozer";
                break;
        }
        
        switch (i % 4) {
            case 0 :
            case 1 : driver.Rating = 1;
                break;
            case 2 :
            case 3 : driver.Rating = 2;
                break;
                
        }
        
        [drivers addObject:driver];
        
        if (i % 2) {
            [mixed addObject:car];
        }
        else {
            [mixed addObject:driver];
        }

        NSLog(@"************************************");

        NSLog(@"%@", car[ma]);
        NSLog(@"%@", car[mo]);
        
    }
    
    
    
    
}
@end
