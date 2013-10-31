//
//  MatchScouting.h
//  Scouting App
//
//  Created by jbertoncin on 1/31/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalVariables.h"

@interface MatchScouting : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *matchNumberLabelMS;
@property (weak, nonatomic) IBOutlet UILabel *teamNumberLabelMS;

@property (weak, nonatomic) IBOutlet UISwitch *autoSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *frisbeesStartedWithSegment;

@property (weak, nonatomic) IBOutlet UIStepper *additionalCollectedStepper;
@property (weak, nonatomic) IBOutlet UILabel *additionalCollectedLabel;

@property (weak, nonatomic) IBOutlet UILabel *pyramidGoalCount;
@property (weak, nonatomic) IBOutlet UILabel *highGoalCount;
@property (weak, nonatomic) IBOutlet UILabel *midGoalCount;
@property (weak, nonatomic) IBOutlet UILabel *lowGoalCount;
@property (weak, nonatomic) IBOutlet UILabel *totalScoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *highAutoGoalCount;
@property (weak, nonatomic) IBOutlet UILabel *midAutoGoalCount;
@property (weak, nonatomic) IBOutlet UILabel *lowAutoGoalCount;

@property (weak, nonatomic) IBOutlet UIStepper *pyramidMissStepOutlet;
@property (weak, nonatomic) IBOutlet UIStepper *highMissStepOutlet;
@property (weak, nonatomic) IBOutlet UIStepper *midMissStepOutlet;
@property (weak, nonatomic) IBOutlet UIStepper *lowMissStepOutlet;

@property (weak, nonatomic) IBOutlet UIButton *autoPyramidBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoPyramidSubtract;
@property (weak, nonatomic) IBOutlet UIButton *autoHighBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoHighSubtract;
@property (weak, nonatomic) IBOutlet UIButton *autoMidBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoMidSubtract;
@property (weak, nonatomic) IBOutlet UIButton *autoLowBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoLowSubtract;

@property (weak, nonatomic) IBOutlet UIStepper *threePtPenaltyStepper;
@property (weak, nonatomic) IBOutlet UILabel *threePtPenaltyLabel;
@property (weak, nonatomic) IBOutlet UIStepper *twentyPtPenaltyStepper;
@property (weak, nonatomic) IBOutlet UILabel *twentyPtPenaltyLabel;
@property (weak, nonatomic) IBOutlet UIStepper *thirtyPtPenaltyStepper;
@property (weak, nonatomic) IBOutlet UILabel *thirtyPtPenaltyLabel;


@property (weak, nonatomic) IBOutlet UILabel *missDisL;
@property (weak, nonatomic) IBOutlet UIStepper *missDisS;
@property (weak, nonatomic) IBOutlet UILabel *missDisTally;

@property (weak, nonatomic) IBOutlet UILabel *autoONlabel;



@end
