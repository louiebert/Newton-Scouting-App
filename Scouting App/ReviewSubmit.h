//
//  ReviewSubmit.h
//  Scouting App
//
//  Created by jbertoncin on 1/31/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchScouting.h"
#import "TowerClimbing.h"
#import "GlobalVariables.h"
#import <QuartzCore/QuartzCore.h>

@interface ReviewSubmit : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *teamNumberLabelRS;
@property (weak, nonatomic) IBOutlet UILabel *matchNumberLabelRS;

@property (weak, nonatomic) IBOutlet UILabel *autonomousTotal;
@property (weak, nonatomic) IBOutlet UILabel *frisbeesInBotLabel;
@property (weak, nonatomic) IBOutlet UILabel *pyramidShotTotal;
@property (weak, nonatomic) IBOutlet UILabel *pyramidMissTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *highShotTotal;
@property (weak, nonatomic) IBOutlet UILabel *highMissTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *midShotTotal;
@property (weak, nonatomic) IBOutlet UILabel *midMissTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowShotTotal;
@property (weak, nonatomic) IBOutlet UILabel *lowMissTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *teleopTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirtyPointPenaltyTotal;
@property (weak, nonatomic) IBOutlet UILabel *twentyPointPenaltyTotal;
@property (weak, nonatomic) IBOutlet UILabel *threePointPenaltyTotal;
@property (weak, nonatomic) IBOutlet UILabel *totalTotal;

@property (weak, nonatomic) IBOutlet UILabel *levelClimbedToLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeOfClimbLabel;

@property (weak, nonatomic) IBOutlet UITextView *notes;

@property (weak, nonatomic) IBOutlet UITextField *teamNumberInput;

@property (weak, nonatomic) IBOutlet UISegmentedControl *defenseSelector;
@property (weak, nonatomic) IBOutlet UIButton *saveBtnOutlet;

-(void)saveData;


@end
