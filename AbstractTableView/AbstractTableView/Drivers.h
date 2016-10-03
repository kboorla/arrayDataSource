//
//  Drivers.h
//  AbstractTableView
//
//  Created by Khechar Boorla on 10/2/16.
//  Copyright © 2016 Khechar Boorla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArrayDataSource.h"


@interface Drivers : NSObject <hasConfigureForCell>

@property (nonatomic, readwrite) NSInteger ID;
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSString * Type;
@property (nonatomic, readwrite) NSInteger Rating;
@property (nonatomic, strong) NSString * SearchString;

+(TableViewSearchConfigureBlock) configureSearchForDefaultPicker;
-(tableViewCell) configureForCell:(UITableViewCell *) cell;

//-(TableViewCellConfigureBlock) configureForCell:(UITableViewCell *) cell;

@end
