//
//  ArrayDataSource.h
//  E360MechanicMobile
//
//  Created by Khechar Boorla on 9/21/16.
//  Copyright © 2016 HCSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ArrayDataSourceHelper.h"

@interface ArrayDataSource : NSObject <UITableViewDataSource>

-(instancetype) initWithItems:(NSArray *) anItems
               cellIdentifier:(NSString *) aCellIdentifier
           configureCellBlock:(TableViewCellConfigureBlock) aConfigureCellBlock
         configureSearchBlock:(TableViewSearchConfigureBlock) aConfigureSearchBlock;

-(instancetype) initWithItems:(NSArray *)anItems
                    cellStyle:(UITableViewCellStyle)aCellStyle
               cellIdentifier:(NSString *)aCellIdentifier
         configureSearchBlock:(TableViewSearchConfigureBlock)aConfigureSearchBlock;

-(instancetype) initWithItems:(NSArray *)anItems
                    tableView:(UITableView *) tableView
                   customCell:(NSString *) aCellXibName
         configureSearchBlock:(TableViewSearchConfigureBlock) aConfigureSearchBlock;

-(void) filterDataSource:(NSString *) searchString;
-(void) setConfigureCellBlock:(TableViewCellConfigureBlock) aConfigureCellBlock;

@end
