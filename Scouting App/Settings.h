//
//  Settings.h
//  Scouting App
//
//  Created by jbertoncin on 1/31/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalVariables.h"

@interface Settings : UIViewController



@property (weak, nonatomic) IBOutlet UITextField *qualMatchTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *whichIPadSeg;
@property (weak, nonatomic) IBOutlet UITextField *scoutNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *teamNumber;
@property (weak, nonatomic) IBOutlet UILabel *matchNumberLabel;



@end
