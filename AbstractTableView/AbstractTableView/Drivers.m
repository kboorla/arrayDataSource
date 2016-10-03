//
//  Drivers.m
//  AbstractTableView
//
//  Created by Khechar Boorla on 10/2/16.
//  Copyright © 2016 Khechar Boorla. All rights reserved.
//

#import "Drivers.h"

@implementation Drivers
@synthesize ID, Name, Type, Rating, SearchString;

+(TableViewSearchConfigureBlock) configureSearchForDefaultPicker {
    TableViewSearchConfigureBlock partConfigureSearch = ^(NSString *searchString, NSArray *itemArray) {
        NSPredicate *p1 = [NSPredicate predicateWithFormat:@"(Name contains[cd] %@) OR (Type contains[cd] %@)", searchString, searchString];
        return [itemArray filteredArrayUsingPredicate:p1];
    };
    
    return partConfigureSearch;
}

-(tableViewCell) configureForCell:(UITableViewCell *) cell {
    struct tableViewCell tvc;
    
    tvc.textLabel = self.Name;
    tvc.detailTextLabel = self.Type;
    tvc.image = [self ratingToImage:self.Rating];
    
    return tvc;
}

-(UIImage *) ratingToImage:(NSInteger) rating {
    UIImage *image;
    
    switch (rating) {
        case 1 : image = [UIImage imageNamed:@"ThumbsUp.png"];
            break;
        case 2 : image = [UIImage imageNamed:@"ThumbsDown.png"];
            break;
        default : image = [[UIImage alloc] init];
        
    }
    return image;
}


@end

