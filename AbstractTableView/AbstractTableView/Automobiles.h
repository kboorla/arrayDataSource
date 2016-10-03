//
//  Automobiles.h
//  AbstractTableView
//
//  Created by Khechar Boorla on 9/29/16.
//  Copyright © 2016 Khechar Boorla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArrayDataSource.h"



@interface Automobiles : NSObject <hasConfigureForCell>

@property (nonatomic, readwrite) NSInteger ID;
@property (nonatomic, strong) NSString * Make;
@property (nonatomic, strong) NSString * Model;
@property (nonatomic, strong) NSString * Color;
@property (nonatomic, strong) NSString * SearchString;

+(TableViewSearchConfigureBlock) configureSearchForDefaultPicker;
-(tableViewCell) configureForCell:(UITableViewCell *) cell;


- (id)objectForKeyedSubscript:(NSString *)key;
- (void)setObject:(id)obj forKeyedSubscript:(NSString *)key;

@end
