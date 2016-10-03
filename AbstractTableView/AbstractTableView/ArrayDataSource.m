//
//  ArrayDataSource.m
//  E360MechanicMobile
//
//  Created by Khechar Boorla on 9/21/16.
//  Copyright © 2016 HCSS. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *filteredItems;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, readwrite) UITableViewCellStyle cellStyle;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) TableViewSearchConfigureBlock configureSearchBlock;

-(id) itemAtIndexPath:(NSIndexPath *) indexPath;

@end

@implementation ArrayDataSource

-(id) init {
    return nil;
}

-(instancetype) initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock configureSearchBlock:(TableViewSearchConfigureBlock) aConfigureSearchBlock; {
    self = [super init];
    if (self) {
        self.items = anItems;
        self.filteredItems = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.configureSearchBlock = [aConfigureSearchBlock copy];
    }
    
    return self;
}

-(instancetype) initWithItems:(NSArray *)anItems cellStyle:(UITableViewCellStyle )aCellStyle cellIdentifier:(NSString *)aCellIdentifier configureSearchBlock:(TableViewSearchConfigureBlock)aConfigureSearchBlock {
    self = [super init];
    if (self) {
        self.items = anItems;
        self.filteredItems = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.cellStyle = aCellStyle;
        self.configureSearchBlock = [aConfigureSearchBlock copy];
    }
    
    return self;
}

-(instancetype) initWithItems:(NSArray *)anItems tableView:(UITableView *) tableView customCell:(NSString *) aCellXibName  configureSearchBlock:(TableViewSearchConfigureBlock) aConfigureSearchBlock {
    self = [super init];
    if (self) {
        self.items = anItems;
        self.filteredItems = anItems;
        self.cellIdentifier = aCellXibName;
        self.configureSearchBlock = [aConfigureSearchBlock copy];
        
        [tableView registerNib:[UINib nibWithNibName:aCellXibName bundle:nil] forCellReuseIdentifier:self.cellIdentifier];
    }
    
    return self;
}

-(void) setConfigureCellBlock:(TableViewCellConfigureBlock) aConfigureCellBlock {
    self.configureCellBlock = aConfigureCellBlock;
}

-(id) itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.filteredItems[(NSUInteger) indexPath.row];
}

-(void) filterDataSource:(NSString *) searchString {
    if ([searchString isEqualToString:@""]) {
        self.filteredItems = self.items;
    }
    else {
        self.filteredItems = self.configureSearchBlock(searchString, self.items);
    }
}

-(TableViewCellConfigureBlock) getConfigureCellBlockForItem:(id) item cell:(id) cell {
    TableViewCellConfigureBlock itemsConfigureCellBlock;
    
    if (self.configureCellBlock) {
        itemsConfigureCellBlock = self.configureCellBlock;
    }
    else if ([cell conformsToProtocol:@protocol(hasConfigureForItem)]) {
        itemsConfigureCellBlock = [cell configureForItem:item];
    }
    else if ([item conformsToProtocol:@protocol(hasConfigureForCell)]) {
        itemsConfigureCellBlock = ^(UITableViewCell *cell, id item) {
            struct tableViewCell tvc;
            tvc = [item configureForCell:cell];
            cell.textLabel.text = tvc.textLabel;
            cell.detailTextLabel.text = tvc.detailTextLabel;
            cell.imageView.image = tvc.image;
        };
    }
    else {
        //do nothing ?
    }
    
    return itemsConfigureCellBlock;
}

#pragma mark UITableViewDataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredItems.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:self.cellStyle reuseIdentifier:self.cellIdentifier];
    }
    
    id item = [self itemAtIndexPath:indexPath];
    TableViewCellConfigureBlock itemsConfigureCellBlock = [self getConfigureCellBlockForItem:item cell:cell];
    
    if (itemsConfigureCellBlock) {
        itemsConfigureCellBlock(cell, item);
    }
    
    return cell;
}

@end
