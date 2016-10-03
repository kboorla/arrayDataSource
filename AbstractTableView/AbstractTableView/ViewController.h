//
//  ViewController.h
//  AbstractTableView
//
//  Created by Khechar Boorla on 9/29/16.
//  Copyright © 2016 Khechar Boorla. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Table1ViewController.h"



@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *CustomButton;
@property (weak, nonatomic) IBOutlet UIButton *Default_Autos;
@property (weak, nonatomic) IBOutlet UIButton *Subtitle_Auto;
@property (weak, nonatomic) IBOutlet UIButton *Default_Drivers;
@property (weak, nonatomic) IBOutlet UIButton *Default_Mixed;
@property (weak, nonatomic) IBOutlet UIButton *Cusomt_Mixed;

- (IBAction)CustomButton:(id)sender;
- (IBAction)Subtitle_Autos:(id)sender;
- (IBAction)Default_Autos:(id)sender;
- (IBAction)Default_Drivers:(id)sender;
- (IBAction)MixedButton:(id)sender;
- (IBAction)Custom_Mixed:(id)sender;

@end

