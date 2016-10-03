//
//  Automobiles.m
//  AbstractTableView
//
//  Created by Khechar Boorla on 9/29/16.
//  Copyright © 2016 Khechar Boorla. All rights reserved.
//

#import "Automobiles.h"

#define MAP_PROP(x,y) NSStringFromSelector(@selector(x)), @#y

#define MAP_PROPS(a,b,c,d) [self mapProperties:  NSStringFromSelector(@selector(a)), @#b, NSStringFromSelector(@selector(c)), @#d, nil];


@implementation Automobiles

@synthesize ID, Make, Model, Color, SearchString;

+(TableViewSearchConfigureBlock) configureSearchForDefaultPicker {
    TableViewSearchConfigureBlock partConfigureSearch = ^(NSString *searchString, NSArray *itemArray) {
        NSPredicate *p1 = [NSPredicate predicateWithFormat:@"(Make contains[cd] %@) OR (Model contains[cd] %@)", searchString, searchString];
        return [itemArray filteredArrayUsingPredicate:p1];
    };
    
    return partConfigureSearch;
}

-(tableViewCell) configureForCell:(UITableViewCell *) cell {
    struct tableViewCell tvc;
    
    tvc.textLabel = self.Make;
    tvc.detailTextLabel = self.Model;
    tvc.image = nil;
    
    return tvc;
}

- (id)objectForKeyedSubscript:(NSString *)key {
    NSDictionary *d = [self mapProperties:  MAP_PROP(Make, ma),
                                            MAP_PROP(Model, mo),
                                            MAP_PROP(Color, co),
                       
                       nil];
    
    return [self valueForKey:d[key]];
//    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys: NSStringFromSelector(@selector(Make)), @"ma",
//                                                                       NSStringFromSelector(@selector(Model)), @"mo",
//                          nil];
//    
//    return [self valueForKey:dict[key]];
//    
//    if ([key isEqualToString:@"Make"]) {
//        return self.Make;
//    }
//    else if ([key isEqualToString:@"Model"]) {
//        return self.Model;
//    }
//    
   // return nil;
}

- (void)setObject:(id)obj forKeyedSubscript:(NSString *)key {
    NSDictionary *d = [[NSDictionary alloc] initWithObjectsAndKeys: MAP_PROP(Make, ma),
                                                                       MAP_PROP(Model, mo),
                                                                       MAP_PROP(Color, co),
                          nil];
    [self setValue:obj forKey:d[key]];
   
   
 //   return [self valueForKey:dict[key]];
    

//    
//    if ([key isEqualToString:@"ma"]) {
//        self.Make = obj;
//    }
//    else if ([key isEqualToString:@"mo"]) {
//        self.Model =obj;
//    }
}


- (NSDictionary *) mapProperties:(id) firstProp, ... {
    NSMutableDictionary *d = [[NSMutableDictionary alloc] init];
    id eachProp;
    id nextProp;
    va_list argumentList;
    if (firstProp) {
        va_start(argumentList, firstProp);
        nextProp = va_arg(argumentList, id);
        if (nextProp) [d setObject:firstProp forKey:nextProp];
        nextProp = nil;
        
        while ((eachProp = va_arg(argumentList, id)) && (nextProp = va_arg(argumentList, id))) {
            //nextProp = va_arg(argumentList, id);
            if (nextProp) [d setObject:eachProp forKey:nextProp];
        }
        va_end(argumentList);
    }
    
    return d;
}

@end
