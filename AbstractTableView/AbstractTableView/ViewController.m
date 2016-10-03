//
//  ViewController.m
//  AbstractTableView
//
//  Created by Khechar Boorla on 9/29/16.
//  Copyright © 2016 Khechar Boorla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CustomButton:(id)sender {
    Table1ViewController *tvc = [[Table1ViewController alloc] initWithNibName:@"Table1ViewController" bundle:nil];
    tvc.tableViewType = @"CustomCell";
    tvc.modalPresentationStyle = UIModalPresentationPopover;
    tvc.popoverPresentationController.sourceRect = [sender bounds];
    tvc.popoverPresentationController.sourceView = sender;
    tvc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    
    [self presentViewController:tvc animated:YES completion:nil];
    //[popOver setPopoverContentSize:CGSizeMake(450,500)];

}

- (IBAction)Default_Autos:(id)sender {
    Table1ViewController *tvc = [[Table1ViewController alloc] initWithNibName:@"Table1ViewController" bundle:nil];
    tvc.tableViewType = @"Default_Autos";
    tvc.modalPresentationStyle = UIModalPresentationPopover;
    tvc.popoverPresentationController.sourceRect = [sender bounds];
    tvc.popoverPresentationController.sourceView = sender;
    tvc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    
    [self presentViewController:tvc animated:YES completion:nil];

}

- (IBAction)Subtitle_Autos:(id)sender {
    Table1ViewController *tvc = [[Table1ViewController alloc] initWithNibName:@"Table1ViewController" bundle:nil];
    tvc.tableViewType = @"Subtitle_Autos";
    tvc.modalPresentationStyle = UIModalPresentationPopover;
    tvc.popoverPresentationController.sourceRect = [sender bounds];
    tvc.popoverPresentationController.sourceView = sender;
    tvc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    
    [self presentViewController:tvc animated:YES completion:nil];
}

- (IBAction)Default_Drivers:(id)sender {
    Table1ViewController *tvc = [[Table1ViewController alloc] initWithNibName:@"Table1ViewController" bundle:nil];
    tvc.tableViewType = @"Default_Drivers";
    tvc.modalPresentationStyle = UIModalPresentationPopover;
    tvc.popoverPresentationController.sourceRect = [sender bounds];
    tvc.popoverPresentationController.sourceView = sender;
    tvc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    
    [self presentViewController:tvc animated:YES completion:nil];

}

- (IBAction)MixedButton:(id)sender {
    Table1ViewController *tvc = [[Table1ViewController alloc] initWithNibName:@"Table1ViewController" bundle:nil];
    tvc.tableViewType = @"Default_Mixed";
    tvc.modalPresentationStyle = UIModalPresentationPopover;
    tvc.popoverPresentationController.sourceRect = [sender bounds];
    tvc.popoverPresentationController.sourceView = sender;
    tvc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    
    [self presentViewController:tvc animated:YES completion:nil];
}

- (IBAction)Custom_Mixed:(id)sender {
    Table1ViewController *tvc = [[Table1ViewController alloc] initWithNibName:@"Table1ViewController" bundle:nil];
    tvc.tableViewType = @"Custom_Mixed";
    tvc.modalPresentationStyle = UIModalPresentationPopover;
    tvc.popoverPresentationController.sourceRect = [sender bounds];
    tvc.popoverPresentationController.sourceView = sender;
    tvc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    
    [self presentViewController:tvc animated:YES completion:nil];
}




@end
