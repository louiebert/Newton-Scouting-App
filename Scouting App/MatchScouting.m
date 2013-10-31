//
//  MatchScouting.m
//  Scouting App
//
//  Created by jbertoncin on 1/31/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import "MatchScouting.h"

@interface MatchScouting () 

- (void)updateScores;

- (IBAction)autonomousSwitch:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *pyramidMissLabel;
@property (weak, nonatomic) IBOutlet UILabel *highMissLabel;
@property (weak, nonatomic) IBOutlet UILabel *midMissLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowMissLabel;

@end

@implementation MatchScouting 

NSInteger autoTotal = 0;
NSInteger autoHighGoal = 0;
NSInteger autoHighGoalMiss = 0;
NSInteger autoMidGoal = 0;
NSInteger autoMidGoalMiss = 0;
NSInteger autoLowGoal = 0;
NSInteger autoLowGoalMiss = 0;
NSInteger additionalCollected = 0;
NSInteger frisbeeCount = 0;
NSInteger frisbeeStepperCount = 0;
NSInteger totalFrisbeeCount = 0;
NSInteger pyramidGoal = 0;
NSInteger pyramidGoalMiss = 0;
NSInteger highGoal = 0;
NSInteger highGoalMiss = 0;
NSInteger midGoal = 0;
NSInteger midGoalMiss = 0;
NSInteger lowGoal = 0;
NSInteger lowGoalMiss = 0;
NSInteger threePointPenaltyTally = 0;
NSInteger twentyPointPenaltyTally = 0;
NSInteger thirtyPointPenaltyTally = 0;
NSInteger teleopTotalScore = 0;
NSInteger totalScore = 0;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    _pyramidGoalCount.text = @"0";
    _highGoalCount.text = @"0";
    _midGoalCount.text = @"0";
    _lowGoalCount.text = @"0";
    _totalScoreLabel.text = @"0";
    _autoPyramidBtn.enabled = FALSE;
    _autoPyramidSubtract.enabled = FALSE;
    _additionalCollectedStepper.maximumValue = 9;
    _pyramidMissStepOutlet.maximumValue = _pyramidMissStepOutlet.value;
    _pyramidMissStepOutlet.minimumValue = _pyramidMissStepOutlet.value;
    _highMissLabel.textColor = [UIColor orangeColor];
    _midMissLabel.textColor = [UIColor orangeColor];
    _lowMissLabel.textColor = [UIColor orangeColor];
    _pyramidMissStepOutlet.alpha = 0;
    _missDisL.alpha = 0;
    _missDisS.alpha = 0;
    _missDisTally.alpha = 0;
    _autoPyramidBtn.alpha = 0;
    _autoPyramidSubtract.alpha = 0;
    _pyramidGoalCount.alpha = 0;
    _autoONlabel.alpha = 1;
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateScores{
    autoTotal = (autoHighGoal*6 + autoMidGoal*4 + autoLowGoal*2);
    teleopTotalScore = (pyramidGoal*5+highGoal*3+midGoal*2+lowGoal);
    totalScore = (teleopTotalScore + autoTotal);
    _totalScoreLabel.text = [[NSString alloc] initWithFormat: @"%d", totalScore];
}

- (IBAction)refreshButton:(id)sender {
    NSArray *redOneTeams = @[
                             @341, @2252, @1741, @155, @4451, @3880, @4519, @1671, @1718, @1305, @3137, @4572, @2471, @1111, @2080, @1899, @128, @503, @2052, @3997, @2352, @3802, @180, @1511, @3756, @217, @1538, @3880, @2655, @175, @1985, @3476, @4539, @4519, @2974, @4652, @1646, @829, @1515, @141, @1986, @303, @2283, @1640, @1208, @296, @2052, @2054, @4713, @3476, @2080, @4656, @3997, @537, @2194, @225, @79, @3130, @2851, @3171, @1311, @68, @1523, @3339, @2054, @3802, @3476, @4656, @2386, @191, @4666, @195, @1523, @1305, @225, @4531, @1899, @4539, @1640, @88, @2619, @2054, @2352, @2612, @829, @4713, @4666, @3880, @1741, @3574, @25, @3931, @190, @141, @2789, @1985, @131, @2439, @4586, @1718, @3574, @141, @1730, @2612, @2389, @2252, @4519, @4652, @3756, @1111, @3476, @1251, @4476, @2439, @155, @2194, @116, @122, @1671, @4572, @1410, @225, @604, @191, @2974, @93, @68, @2783, @2851, @25, @341, @128, @141, @1305];
    NSArray *redTwoTeams = @[
                             @3756, @296, @2439, @93, @2655, @1986, @503, @2389, @4656, @3339, @25, @2352, @2283, @4652, @4505, @2619, @2783, @604, @341, @1311, @3280, @1739, @771, @25, @537, @2252, @3137, @68, @353, @128, @1899, @2283, @3931, @4572, @2386, @2352, @122, @2471, @3280, @93, @4586, @128, @4451, @353, @1985, @1730, @4519, @3130, @3880, @4666, @303, @353, @128, @1538, @2389, @4539, @4487, @1781, @4713, @1676, @2052, @1515, @4666, @296, @1511, @2471, @2655, @1985, @3756, @3244, @4487, @1676, @3997, @1511, @771, @492, @537, @2471, @1111, @3574, @4828, @217, @116, @604, @2194, @2080, @1410, @3339, @225, @1523, @2655, @3802, @3997, @122, @2389, @303, @1646, @1781, @1739, @2826, @1208, @3171, @2789, @122, @492, @1511, @175, @4531, @1523, @2352, @1515, @1410, @3244, @1718, @4629, @1986, @2386, @4505, @131, @1111, @1885, @303, @3574, @1538, @1251, @4451, @1676, @2194, @79, @1569, @3130, @4476, @3280, @4505];
    NSArray *redThreeTeams = @[
                               @180, @195, @1538, @2052, @2612, @2826, @4476, @68, @2974, @1730, @122, @3244, @1208, @79, @771, @88, @1781, @492, @1305, @4476, @829, @2789, @1885, @2612, @2851, @3244, @155, @2619, @2080, @3130, @1569, @4586, @2054, @1718, @537, @341, @1305, @88, @1739, @190, @1676, @3931, @4828, @131, @4487, @2851, @4531, @4629, @1251, @1569, @829, @3137, @2439, @1885, @3574, @217, @2783, @3280, @4276, @4531, @4828, @4586, @2789, @1986, @1741, @1251, @2974, @3171, @4652, @1410, @190, @93, @1646, @1515, @1718, @3137, @4572, @2080, @1730, @1569, @2826, @1311, @4505, @3171, @1899, @296, @771, @191, @1640, @2974, @2386, @1569, @175, @4487, @93, @180, @2252, @4629, @353, @1671, @3997, @503, @4539, @180, @1538, @604, @4656, @1671, @3339, @1885, @1640, @2655, @1739, @79, @195, @4276, @4713, @1781, @3802, @4666, @4652, @2252, @155, @503, @1515, @1730, @2612, @1741, @2826, @217, @1311, @4276, @116, @492];
    NSArray *blueOneTeams = @[
                              @4828, @191, @1515, @2194, @3997, @3574, @3476, @4713, @3802, @1251, @1985, @2851, @1885, @1569, @4487, @3931, @1676, @1730, @1640, @3171, @4828, @4531, @1523, @2471, @122, @4505, @1111, @4652, @141, @1671, @1515, @131, @2826, @1741, @4505, @492, @2789, @1111, @4276, @180, @1410, @217, @2194, @3574, @2655, @1671, @2783, @3802, @3756, @3339, @1739, @2252, @155, @3931, @122, @2974, @191, @1985, @4519, @2352, @1410, @1208, @141, @180, @492, @771, @1111, @2851, @3931, @604, @131, @3339, @2783, @79, @2789, @4713, @2655, @2389, @4629, @4451, @1741, @1671, @25, @1251, @1305, @4656, @3137, @4539, @4652, @1730, @492, @503, @1676, @1511, @4476, @2619, @155, @4572, @1311, @3756, @4666, @771, @4713, @217, @3280, @2619, @3931, @1646, @1985, @3880, @1311, @2851, @2826, @4451, @537, @68, @4487, @190, @2052, @492, @3476, @2471, @1739, @1718, @3244, @537, @353, @2789, @2386, @2439, @4487, @2655, @2283, @180];
    NSArray *blueTwoTeams = @[
                              @1511, @1640, @3171, @1781, @1739, @2789, @3280, @1523, @1410, @4586, @2054, @1311, @353, @190, @4629, @3130, @225, @4276, @2389, @2974, @3339, @4572, @4451, @1646, @88, @1718, @1251, @93, @79, @2194, @4713, @2783, @296, @3997, @3137, @771, @1311, @116, @1885, @4656, @2619, @195, @4539, @3171, @2389, @4476, @2826, @225, @175, @1741, @2283, @1305, @4652, @1646, @4572, @131, @93, @1730, @190, @3756, @3880, @341, @4505, @1718, @4451, @1640, @2826, @2194, @4276, @303, @1885, @1208, @3280, @296, @3476, @141, @2252, @3130, @4519, @4586, @3802, @1986, @1538, @128, @3476, @2783, @79, @4519, @537, @195, @1986, @2283, @217, @1538, @2612, @4531, @4451, @1885, @4505, @116, @1899, @2783, @2052, @3802, @88, @2974, @4505, @1781, @4572, @128, @303, @2283, @3130, @2471, @25, @1569, @353, @1208, @3997, @1646, @175, @3880, @296, @4629, @4519, @2080, @829, @2352, @2389, @2619, @195, @4828, @1640, @2974];
    NSArray *blueThreeTeams = @[
                                @4666, @2386, @175, @492, @116, @537, @217, @604, @4276, @141, @829, @4539, @4531, @303, @1646, @131, @4666, @2439, @1986, @191, @4656, @190, @2386, @1410, @303, @3574, @225, @116, @195, @1208, @1676, @4629, @4487, @25, @503, @191, @2439, @604, @2252, @3244, @2080, @1511, @1538, @1781, @155, @1899, @68, @1523, @79, @2612, @2386, @88, @3244, @604, @503, @116, @1671, @2612, @195, @4629, @1569, @25, @2619, @175, @1899, @4476, @2439, @1739, @2052, @353, @829, @503, @3880, @2283, @68, @128, @341, @180, @122, @175, @1781, @155, @4476, @2052, @3244, @341, @3280, @88, @1208, @2471, @3130, @2352, @4828, @68, @2054, @4276, @2851, @1251, @1111, @1515, @2080, @4828, @829, @191, @296, @190, @225, @4586, @131, @2054, @93, @1741, @1676, @341, @1305, @3137, @3339, @4539, @1511, @4656, @1985, @3171, @3756, @1899, @1986, @4531, @3931, @88, @4586, @771, @3137, @1523, @2054, @4652];
    
    if (matchNumber < 1) {
        _teamNumberLabelMS.text = [[NSString alloc] initWithFormat:@"????"];
        _matchNumberLabelMS.text = [[NSString alloc] initWithFormat:@"??"];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"NO MATCH NUMBER"
                                                       message: @"Please enter a valid match number for this regional in the settings tab."
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    else if (matchNumber > 134) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"NO MORE MATCHES"
                                                       message: @"You have exceeded the total amount of matches for this regional."
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    else{
        _matchNumberLabelMS.text = [[NSString alloc] initWithFormat: @"%d", matchNumber];
        if(iPadNumber == 0){
            _teamNumberLabelMS.text = [[NSString alloc] initWithFormat: @"%@", [redOneTeams objectAtIndex:
                                                                         (matchNumber-1)]];
            _teamNumberLabelMS.textColor = [UIColor redColor];
        }
        if(iPadNumber == 1){
            _teamNumberLabelMS.text = [[NSString alloc] initWithFormat: @"%@", [redTwoTeams objectAtIndex:
                                                                         (matchNumber-1)]];
            _teamNumberLabelMS.textColor = [UIColor redColor];
        }
        if(iPadNumber == 2){
            _teamNumberLabelMS.text = [[NSString alloc] initWithFormat: @"%@", [redThreeTeams objectAtIndex:
                                                                         (matchNumber-1)]];
            _teamNumberLabelMS.textColor = [UIColor redColor];
        }
        if(iPadNumber == 3){
            _teamNumberLabelMS.text = [[NSString alloc] initWithFormat: @"%@", [blueOneTeams objectAtIndex:
                                                                         (matchNumber-1)]];
            _teamNumberLabelMS.textColor = [UIColor blueColor];
        }
        if(iPadNumber == 4){
            _teamNumberLabelMS.text = [[NSString alloc] initWithFormat: @"%@", [blueTwoTeams objectAtIndex:
                                                                         (matchNumber-1)]];
            _teamNumberLabelMS.textColor = [UIColor blueColor];
        }
        if(iPadNumber == 5){
            _teamNumberLabelMS.text = [[NSString alloc] initWithFormat: @"%@", [blueThreeTeams objectAtIndex:
                                                                         (matchNumber-1)]];
            _teamNumberLabelMS.textColor = [UIColor blueColor];
        }
    }
    additionalCollected = 0;
    _additionalCollectedStepper.value = 0;
    _additionalCollectedLabel.text = @"0";
    frisbeeStepperCount = 0;
    pyramidGoal = 0;
    _pyramidGoalCount.text = [[NSString alloc] initWithFormat:@"%d", pyramidGoal];
    autoHighGoal = 0;
    _highAutoGoalCount.text = [[NSString alloc] initWithFormat: @"%d", autoHighGoal];
    highGoal = 0;
    _highGoalCount.text = [[NSString alloc] initWithFormat: @"%d", highGoal];
    autoMidGoal = 0;
    _midAutoGoalCount.text = [[NSString alloc] initWithFormat: @"%d", autoMidGoal];
    midGoal = 0;
    _midGoalCount.text = [[NSString alloc] initWithFormat: @"%d", midGoal];
    autoLowGoal = 0;
    _lowAutoGoalCount.text = [[NSString alloc] initWithFormat: @"%d", autoLowGoal];
    lowGoal = 0;
    _lowGoalCount.text = [[NSString alloc] initWithFormat: @"%d", lowGoal];
    _pyramidMissStepOutlet.value = 0;
    pyramidGoalMiss = 0;
    _pyramidMissLabel.text = @"0";
    autoHighGoalMiss = 0;
    _highMissStepOutlet.value = 0;
    highGoalMiss = 0;
    _highMissLabel.text = @"0";
    autoMidGoalMiss = 0;
    _midMissStepOutlet.value = 0;
    midGoalMiss = 0;
    _midMissLabel.text = @"0";
    autoLowGoalMiss = 0;
    _lowMissStepOutlet.value = 0;
    lowGoalMiss = 0;
    _lowMissLabel.text = @"0";
    _threePtPenaltyStepper.value = 0;
    _threePtPenaltyLabel.text = @"0";
    threePointPenaltyTally = 0;
    _twentyPtPenaltyStepper.value = 0;
    _twentyPtPenaltyLabel.text = @"0";
    twentyPointPenaltyTally = 0;
    _thirtyPtPenaltyStepper.value = 0;
    _thirtyPtPenaltyLabel.text = @"0";
    thirtyPointPenaltyTally = 0;
    _frisbeesStartedWithSegment.enabled = TRUE;
    _additionalCollectedStepper.maximumValue = 9;
    _additionalCollectedStepper.minimumValue = 0;
    _autoPyramidBtn.enabled = FALSE;
    _pyramidMissStepOutlet.maximumValue = _pyramidMissStepOutlet.value;
    _pyramidMissStepOutlet.minimumValue = _pyramidMissStepOutlet.value;
    _autoPyramidSubtract.enabled = FALSE;
    _autoSwitch.on = TRUE;
    _highMissLabel.textColor = [UIColor orangeColor];
    _midMissLabel.textColor = [UIColor orangeColor];
    _lowMissLabel.textColor = [UIColor orangeColor];
    matchNumber++;
    _pyramidMissStepOutlet.alpha = 0;
    _missDisL.alpha = 0;
    _missDisS.alpha = 0;
    _missDisTally.alpha = 0;
    _autoPyramidBtn.alpha = 0;
    _autoPyramidSubtract.alpha = 0;
    _pyramidGoalCount.alpha = 0;
    _autoONlabel.alpha = 1;
    [self updateScores];
}

- (IBAction)autonomousSwitch:(id)sender{
    if(_autoSwitch.on){
        _autoPyramidBtn.enabled = FALSE;
        _autoPyramidSubtract.enabled = FALSE;
        _frisbeesStartedWithSegment.enabled = TRUE;
        _pyramidMissStepOutlet.maximumValue = _pyramidMissStepOutlet.value;
        _pyramidMissStepOutlet.minimumValue = _pyramidMissStepOutlet.value;
        _additionalCollectedStepper.maximumValue = 9;
        _additionalCollectedStepper.minimumValue = 0;
        _additionalCollectedStepper.value = additionalCollected;
        _highMissLabel.textColor = [UIColor orangeColor];
        _midMissLabel.textColor = [UIColor orangeColor];
        _lowMissLabel.textColor = [UIColor orangeColor];
        _highMissStepOutlet.value = autoHighGoalMiss;
        _highMissLabel.text = [[NSString alloc] initWithFormat: @"%d", autoHighGoalMiss];
        _midMissStepOutlet.value = autoMidGoalMiss;
        _midMissLabel.text = [[NSString alloc] initWithFormat: @"%d", autoMidGoalMiss];
        _lowMissStepOutlet.value = autoLowGoalMiss;
        _lowMissLabel.text = [[NSString alloc] initWithFormat: @"%d", autoLowGoalMiss];
        _pyramidMissLabel.text = @"0";
        _pyramidMissStepOutlet.alpha = 0;
        _missDisL.alpha = 0;
        _missDisS.alpha = 0;
        _missDisTally.alpha = 0;
        _autoPyramidBtn.alpha = 0;
        _autoPyramidSubtract.alpha = 0;
        _pyramidGoalCount.alpha = 0;
        _autoONlabel.alpha = 1;
    }
    else{
        _autoPyramidBtn.enabled = TRUE;
        _autoPyramidSubtract.enabled = TRUE;
        _frisbeesStartedWithSegment.enabled = FALSE;
        _pyramidMissStepOutlet.maximumValue = 100;
        _pyramidMissStepOutlet.minimumValue = 0;
        _additionalCollectedStepper.maximumValue = additionalCollected;
        _additionalCollectedStepper.minimumValue = additionalCollected;
        _additionalCollectedStepper.value = additionalCollected;
        _highMissLabel.textColor = [UIColor blackColor];
        _midMissLabel.textColor = [UIColor blackColor];
        _lowMissLabel.textColor = [UIColor blackColor];
        _highMissStepOutlet.value = highGoalMiss;
        _highMissLabel.text = [[NSString alloc] initWithFormat: @"%d", highGoalMiss];
        _midMissStepOutlet.value = midGoalMiss;
        _midMissLabel.text = [[NSString alloc] initWithFormat: @"%d", midGoalMiss];
        _lowMissStepOutlet.value = lowGoalMiss;
        _lowMissLabel.text = [[NSString alloc] initWithFormat: @"%d", lowGoalMiss];
        _pyramidMissLabel.text = [[NSString alloc] initWithFormat: @"%d", pyramidGoalMiss];
        _pyramidMissStepOutlet.alpha = 1;
        _missDisL.alpha = 1;
        _missDisS.alpha = 1;
        _missDisTally.alpha = 1;
        _autoPyramidBtn.alpha = 1;
        _autoPyramidSubtract.alpha = 1;
        _pyramidGoalCount.alpha = 1;
        _autoONlabel.alpha = 0;
    }
}


- (IBAction)frisbeeCountSeg:(id)sender {
    if (_frisbeesStartedWithSegment.selectedSegmentIndex == 0){
        frisbeeCount = 0;
        totalFrisbeeCount = frisbeeCount + frisbeeStepperCount;
    }
    if (_frisbeesStartedWithSegment.selectedSegmentIndex == 1){
        frisbeeCount = 1;
        totalFrisbeeCount = frisbeeCount + frisbeeStepperCount;
    }
    if (_frisbeesStartedWithSegment.selectedSegmentIndex == 2){
        frisbeeCount = 2;
        totalFrisbeeCount = frisbeeCount + frisbeeStepperCount;
    }
    if (_frisbeesStartedWithSegment.selectedSegmentIndex == 3){
        frisbeeCount = 3;
        totalFrisbeeCount = frisbeeCount + frisbeeStepperCount;
    }
}
- (IBAction)additionalCollectedStep:(id)sender {
    additionalCollected = _additionalCollectedStepper.value;
    _additionalCollectedLabel.text = [[NSString alloc] initWithFormat:@"%d", additionalCollected];
    frisbeeStepperCount = _additionalCollectedStepper.value;
    totalFrisbeeCount = frisbeeCount + frisbeeStepperCount;
}

- (IBAction)pyramidGoalScore:(id)sender {
    pyramidGoal++;
    if(pyramidGoal >= 6){
        pyramidGoal = 6;
    }
    _pyramidGoalCount.text = [[NSString alloc] initWithFormat: @"%d", pyramidGoal];
    [self updateScores];
}
- (IBAction)subtractPyramidGoalScore:(id)sender {
    pyramidGoal--;
    if(pyramidGoal < 0){
        pyramidGoal = 0;
    }
    _pyramidGoalCount.text = [[NSString alloc] initWithFormat: @"%d", pyramidGoal];
    [self updateScores];
}

- (IBAction)highGoalScore:(id)sender {
    if(_autoSwitch.on){
        autoHighGoal++;
        _highAutoGoalCount.text = [[NSString alloc] initWithFormat: @"%d", autoHighGoal];
    }
    else{
        highGoal++;
        _highGoalCount.text = [[NSString alloc] initWithFormat: @"%d", highGoal];
    }
    [self updateScores];
}
- (IBAction)subtractHIghGoalScore:(id)sender {
    if(_autoSwitch.on){
        autoHighGoal--;
        if(autoHighGoal < 0){
            autoHighGoal = 0;
        }
        _highAutoGoalCount.text = [[NSString alloc] initWithFormat: @"%d", autoHighGoal];
    }
    else{
        highGoal--;
        if(highGoal < 0){
            highGoal = 0;
        }
        _highGoalCount.text = [[NSString alloc] initWithFormat: @"%d", highGoal];
    }
    [self updateScores];
}

- (IBAction)midGoalScore:(id)sender {
    if(_autoSwitch.on){
        autoMidGoal++;
        _midAutoGoalCount.text = [[NSString alloc] initWithFormat: @"%d", autoMidGoal];
    }
    else{
        midGoal++;
        _midGoalCount.text = [[NSString alloc] initWithFormat: @"%d", midGoal];
    }
    [self updateScores];
}
- (IBAction)subtractMidGoalScore:(id)sender {
    if(_autoSwitch.on){
        autoMidGoal--;
        if(autoMidGoal < 0){
            autoMidGoal = 0;
        }
        _midAutoGoalCount.text = [[NSString alloc] initWithFormat: @"%d", autoMidGoal];
    }
    else{
        midGoal--;
        if(midGoal < 0){
            midGoal = 0;
        }
        _midGoalCount.text = [[NSString alloc] initWithFormat: @"%d", midGoal];
    }
    [self updateScores];
}

- (IBAction)lowGoalScore:(id)sender {
     if(_autoSwitch.on){
        autoLowGoal++;
         _lowAutoGoalCount.text = [[NSString alloc] initWithFormat: @"%d", autoLowGoal];
    }
     else{
        lowGoal++;
        _lowGoalCount.text = [[NSString alloc] initWithFormat: @"%d", lowGoal];
    }
    [self updateScores];
}
- (IBAction)subtractLowGoalScore:(id)sender {
    if(_autoSwitch.on){
        autoLowGoal--;
        if(autoLowGoal < 0){
            autoLowGoal = 0;
        }
        _lowAutoGoalCount.text = [[NSString alloc] initWithFormat: @"%d", autoLowGoal];
    }
    else{
        lowGoal--;
        if(lowGoal < 0){
            lowGoal = 0;
        }
        _lowGoalCount.text = [[NSString alloc] initWithFormat: @"%d", lowGoal];
    }
    [self updateScores];
}


- (IBAction)pyramidMissStep:(id)sender {
    pyramidGoalMiss = _pyramidMissStepOutlet.value;
    _pyramidMissLabel.text = [[NSString alloc] initWithFormat: @"%d", pyramidGoalMiss];
}
- (IBAction)highMissStep:(id)sender {
    if(_autoSwitch.on){
        autoHighGoalMiss = _highMissStepOutlet.value;
        _highMissLabel.text = [[NSString alloc] initWithFormat: @"%d", autoHighGoalMiss];
    }
    else{
        highGoalMiss = _highMissStepOutlet.value;
        _highMissLabel.text = [[NSString alloc] initWithFormat: @"%d", highGoalMiss];
    }
}
- (IBAction)midMissStep:(id)sender {
    if(_autoSwitch.on){
        autoMidGoalMiss = _midMissStepOutlet.value;
        _midMissLabel.text = [[NSString alloc] initWithFormat: @"%d", autoMidGoalMiss];
    }
    else{
        midGoalMiss = _midMissStepOutlet.value;
        _midMissLabel.text = [[NSString alloc] initWithFormat:@"%d", midGoalMiss];
    }
}
- (IBAction)lowMissStep:(id)sender {
    if(_autoSwitch.on){
        autoLowGoalMiss = _lowMissStepOutlet.value;
        _lowMissLabel.text = [[NSString alloc] initWithFormat: @"%d", autoLowGoalMiss];
    }
    else{
        lowGoalMiss = _lowMissStepOutlet.value;
        _lowMissLabel.text = [[NSString alloc] initWithFormat:@"%d", lowGoalMiss];
    }
}


- (IBAction)threePtPenaltyStep:(id)sender {
    threePointPenaltyTally = _threePtPenaltyStepper.value;
    _threePtPenaltyLabel.text = [[NSString alloc] initWithFormat: @"%1.0f",_threePtPenaltyStepper.value];
}
- (IBAction)twentyPtPenaltyStep:(id)sender {
    twentyPointPenaltyTally = _twentyPtPenaltyStepper.value;
    _twentyPtPenaltyLabel.text = [[NSString alloc] initWithFormat: @"%1.0f", _twentyPtPenaltyStepper.value];
}

- (IBAction)thirtyPtPenaltyStep:(id)sender {
    thirtyPointPenaltyTally = _thirtyPtPenaltyStepper.value;
    _thirtyPtPenaltyLabel.text = [[NSString alloc] initWithFormat: @"%1.0f", _thirtyPtPenaltyStepper.value];
}






@end
