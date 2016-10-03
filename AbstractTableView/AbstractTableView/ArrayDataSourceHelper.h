//
//  ConfigureTableViewCellBlock.h
//  AbstractTableView
//
//  Created by Khechar Boorla on 9/30/16.
//  Copyright © 2016 Khechar Boorla. All rights reserved.
//

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

typedef NSArray* (^TableViewSearchConfigureBlock)(id searchString, id item);

typedef struct tableViewCell {
    __unsafe_unretained NSString *textLabel;
    __unsafe_unretained NSString *detailTextLabel;
    __unsafe_unretained UIImage *image;
} tableViewCell;

@protocol hasConfigureForItem <NSObject>

-(TableViewCellConfigureBlock) configureForItem:(id)item;

@end

@protocol hasConfigureForCell <NSObject>

-(tableViewCell) configureForCell:(UITableViewCell *)cell;

@end
