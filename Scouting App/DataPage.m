//
//  DataPage.m
//  KC Match Scouting App
//
//  Created by Eris on 3/10/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import "DataPage.h"
#import "GlobalVariables.h"

@interface DataPage ()

//HERE'S A RANDOM COMMENT YO!!!

@end

@implementation DataPage

NSString *teamNumberSpecifiedStr;
NSString *matchNumberSpecifiedStr;
NSArray *sortedArray;
NSInteger teleopAvgInt;
NSInteger teleopAvgIntTotal;
NSInteger autoAvgInt;
NSInteger autoAvgIntTotal;
NSInteger climbLvlAvgInt;
NSInteger climbLvlAvgIntTotal;
NSInteger climbTimeAvgInt;
NSInteger climbTimeAvgIntTotal;

NSInteger numAutoPts = 0;
NSInteger totalAutoShotsMade = 0;
NSInteger totalAutoShotsTaken = 0;
NSInteger teleShotPoints = 0;
NSInteger teleShotsMade = 0;
NSInteger teleShotsAttempted = 0;
NSInteger totalPenaltyTally = 0;
NSInteger climbPts = 0;
NSInteger climbTime = 0;
NSString *notes;
NSString *currentMatchNumber;


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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateMatches{
    _teleopTotalOne.text = @"0";_teleopTotalTwo.text = @"0";_teleopTotalThree.text = @"0";_teleopTotalFour.text = @"0";_teleopTotalFive.text = @"0";_teleopTotalSix.text = @"0";_teleopTotalSeven.text = @"0";_teleopTotalEight.text = @"0";_teleopTotalNine.text = @"0";_teleopTotalTen.text = @"0";_teleopTotalEleven.text = @"0";_teleopTotalTwelve.text = @"0";_teleopTotalThirteen.text = @"0";_teleopTotalFourteen.text = @"0";
    _autoTotalOne.text = @"0";_autoTotalTwo.text = @"0";_autoTotalThree.text = @"0";_autoTotalFour.text = @"0";_autoTotalFive.text = @"0";_autoTotalSix.text = @"0";_autoTotalSeven.text = @"0";_autoTotalEight.text = @"0";_autoTotalNine.text = @"0";_autoTotalTen.text = @"0";_autoTotalEleven.text = @"0";_autoTotalTwelve.text = @"0";_autoTotalThirteen.text = @"0";_autoTotalFourteen.text = @"0";
    _climbLvlOne.text = @"0";_climbLvlTwo.text = @"0";_climbLvlThree.text = @"0";_climbLvlFour.text = @"0";_climbLvlFive.text = @"0";_climbLvlSix.text = @"0";_climbLvlSeven.text = @"0";_climbLvlEight.text = @"0";_climbLvlNine.text = @"0";_climbLvlTen.text = @"0";_climbLvlEleven.text = @"0";_climbLvlTwelve.text = @"0";_climbLvlThirteen.text = @"0";_climbLvlFourteen.text = @"0";
    _teleopAvg.text = @"0";
    _climbLevelAvg.text = @"0";
    _autoAvg.text = @"0";
    _climbTimeAvg.text = @"0";
    _matchXnumber.text = @"0";
    _matchXscoutInitials.text = @"{scout}";
    _matchXautoHigh.text = @"0";
    _matchXautoMid.text = @"0";
    _matchXautoLow.text = @"0";
    _matchXpyramid.text = @"0";
    _matchXhigh.text = @"0";
    _matchXmid.text = @"0";
    _matchXlow.text = @"0";
    _matchXclimbTime.text = @"(00 : 00)";
    _matchXthreePtPenalties.text = @"0";
    _matchXtwentyPtPenalties.text = @"0";
    _matchXthirtyPtPenalties.text = @"0";
    _matchXtotalScore.text = @"0";
    _matchXnotes.text = @"[notes]";
    teamNumberSpecifiedStr = _teamNumberInputD.text;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:@"Data.plist"]) {
        [[NSFileManager defaultManager] copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"Data" ofType:@"plist"] toPath:path error:nil];
    }
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSArray * teamArray = [dataDictD allKeys];
    for (int team = 0; team < teamArray.count; team++) {
        if ([[teamArray objectAtIndex:team] isEqual: @"Red1"] || [[teamArray objectAtIndex:team] isEqual: @"Red2"] || [[teamArray objectAtIndex:team] isEqual: @"Red3"] || [[teamArray objectAtIndex:team] isEqual: @"Blue1"] || [[teamArray objectAtIndex:team] isEqual: @"Blue2"] || [[teamArray objectAtIndex:team] isEqual: @"Blue3"]) {
                //Don't print red1 stuff
        }
        else{
            NSArray *matches = [[dataDictD objectForKey:[teamArray objectAtIndex:team]] allKeys];
            for (int i = 0; i < matches.count; i++) {
                numAutoPts = 0;
                totalAutoShotsMade = 0;
                totalAutoShotsTaken = 0;
                teleShotPoints = 0;
                teleShotsMade = 0;
                teleShotsAttempted = 0;
                totalPenaltyTally = 0;
                climbPts = 0;
                climbTime = 0;
                
                
                numAutoPts = ([[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"autonomousTotal"] intValue]);
                totalAutoShotsMade = ([[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"autoHighMade"] intValue]+ [[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"autoMidMade"] intValue] + [[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"autoLowMade"] intValue]);
                totalAutoShotsTaken = totalAutoShotsMade + ([[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"autoHighMisses"] intValue]+ [[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"autoMidMisses"] intValue] + [[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"autoLowMisses"] intValue]);
                teleShotPoints = ([[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"teleopTotal"] intValue]);
                teleShotsMade = ([[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"pyramidShotsMade"] intValue] + [[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"highShotsMade"] intValue]+ [[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"midShotsMade"] intValue] + [[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"lowShotsMade"] intValue]);
                teleShotsAttempted = teleShotsMade + ([[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"pyramidMisses"] intValue] +[[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"highMisses"] intValue]+ [[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"lowMisses"] intValue]);
                totalPenaltyTally = ([[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"threePtPenalties"] intValue]+ [[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"twentyPtPenalties"] intValue] + [[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"thirtyPtPenalties"] intValue]);
                climbPts = ([[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"levelClimbedTo"] intValue]*10);
                climbTime = ([[[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"timeOfClimb"] intValue]);
                NSLog(@"| %@| %d| %d| %d| %d| %d| %d| %d| %d| %d| %d| {%@}| {%@}", [teamArray objectAtIndex:team], i+1, numAutoPts, totalAutoShotsMade, totalAutoShotsTaken, teleShotPoints, teleShotsMade, teleShotsAttempted,totalPenaltyTally, climbPts, climbTime, [[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"notes"], [[[dataDictD objectForKey:[teamArray objectAtIndex:team]] objectForKey:[matches objectAtIndex:i]] objectForKey:@"defense"]);
            }
        }
    }
    if ([dataDictD objectForKey:teamNumberSpecifiedStr] == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"BAD TEAM NUMBER"
                                                       message: @"Please enter a valid team number for this regional."
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
        _detailOne.enabled = FALSE;
        _detailTwo.enabled = FALSE;
        _detailThree.enabled = FALSE;
        _detailFour.enabled = FALSE;
        _detailFive.enabled = FALSE;
        _detailSix.enabled = FALSE;
        _detailSeven.enabled = FALSE;
        _detailEight.enabled = FALSE;
        _detailNine.enabled = FALSE;
        _detailTen.enabled = FALSE;
        _detailEleven.enabled = FALSE;
        _detailTwelve.enabled = FALSE;
        _detailThirteen.enabled = FALSE;
        _detailFourteen.enabled = FALSE;
        _detailOne.alpha = 0.5;
        _detailTwo.alpha = 0.5;
        _detailThree.alpha = 0.5;
        _detailFour.alpha = 0.5;
        _detailFive.alpha = 0.5;
        _detailSix.alpha = 0.5;
        _detailSeven.alpha = 0.5;
        _detailEight.alpha = 0.5;
        _detailNine.alpha = 0.5;
        _detailTen.alpha = 0.5;
        _detailEleven.alpha = 0.5;
        _detailTwelve.alpha = 0.5;
        _detailThirteen.alpha = 0.5;
        _detailFourteen.alpha = 0.5;
    }
    else{
        _detailOne.enabled = FALSE;
        _detailTwo.enabled = FALSE;
        _detailThree.enabled = FALSE;
        _detailFour.enabled = FALSE;
        _detailFive.enabled = FALSE;
        _detailSix.enabled = FALSE;
        _detailSeven.enabled = FALSE;
        _detailEight.enabled = FALSE;
        _detailNine.enabled = FALSE;
        _detailTen.enabled = FALSE;
        _detailEleven.enabled = FALSE;
        _detailTwelve.enabled = FALSE;
        _detailThirteen.enabled = FALSE;
        _detailFourteen.enabled = FALSE;
        _detailOne.alpha = 0.5;
        _detailTwo.alpha = 0.5;
        _detailThree.alpha = 0.5;
        _detailFour.alpha = 0.5;
        _detailFive.alpha = 0.5;
        _detailSix.alpha = 0.5;
        _detailSeven.alpha = 0.5;
        _detailEight.alpha = 0.5;
        _detailNine.alpha = 0.5;
        _detailTen.alpha = 0.5;
        _detailEleven.alpha = 0.5;
        _detailTwelve.alpha = 0.5;
        _detailThirteen.alpha = 0.5;
        _detailFourteen.alpha = 0.5;
        if (sortedArray.count<1) {
        //anti-crash
            _teleopTotalOne.text = @"0";_teleopTotalTwo.text = @"0";_teleopTotalThree.text = @"0";_teleopTotalFour.text = @"0";_teleopTotalFive.text = @"0";_teleopTotalSix.text = @"0";_teleopTotalSeven.text = @"0";_teleopTotalEight.text = @"0";_teleopTotalNine.text = @"0";_teleopTotalTen.text = @"0";_teleopTotalEleven.text = @"0";_teleopTotalTwelve.text = @"0";_teleopTotalThirteen.text = @"0";_teleopTotalFourteen.text = @"0";
            _autoTotalOne.text = @"0";_autoTotalTwo.text = @"0";_autoTotalThree.text = @"0";_autoTotalFour.text = @"0";_autoTotalFive.text = @"0";_autoTotalSix.text = @"0";_autoTotalSeven.text = @"0";_autoTotalEight.text = @"0";_autoTotalNine.text = @"0";_autoTotalTen.text = @"0";_autoTotalEleven.text = @"0";_autoTotalTwelve.text = @"0";_autoTotalThirteen.text = @"0";_autoTotalFourteen.text = @"0";
            _climbLvlOne.text = @"0";_climbLvlTwo.text = @"0";_climbLvlThree.text = @"0";_climbLvlFour.text = @"0";_climbLvlFive.text = @"0";_climbLvlSix.text = @"0";_climbLvlSeven.text = @"0";_climbLvlEight.text = @"0";_climbLvlNine.text = @"0";_climbLvlTen.text = @"0";_climbLvlEleven.text = @"0";_climbLvlTwelve.text = @"0";_climbLvlThirteen.text = @"0";_climbLvlFourteen.text = @"0";
            _teleopAvg.text = @"0";
            _climbLevelAvg.text = @"0";
            _autoAvg.text = @"0";
            _climbTimeAvg.text = @"0";
            _matchXnumber.text = @"0";
            _matchXscoutInitials.text = @"{scout}";
            _matchXautoHigh.text = @"0";
            _matchXautoMid.text = @"0";
            _matchXautoLow.text = @"0";
            _matchXpyramid.text = @"0";
            _matchXhigh.text = @"0";
            _matchXmid.text = @"0";
            _matchXlow.text = @"0";
            _matchXclimbTime.text = @"(00 : 00)";
            _matchXthreePtPenalties.text = @"0";
            _matchXtwentyPtPenalties.text = @"0";
            _matchXthirtyPtPenalties.text = @"0";
            _matchXtotalScore.text = @"0";
            _matchXnotes.text = @"[notes]";
            _matchXdefense.text = @"Y/N";
                }
        else{
            _teleopTotalOne.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlOne.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalOne.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"timeOfClimb"] intValue] == 0) {
                climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"timeOfClimb"] intValue];
            }
        }
        if (sortedArray.count<2) {
        //anti-crash
        }
        else{
            _teleopTotalTwo.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlTwo.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalTwo.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"timeOfClimb"] intValue] == 0) {
                climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"timeOfClimb"] intValue];
            }
        }
        if (sortedArray.count<3) {
            //anti-crash
        }
        else{
            _teleopTotalThree.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlThree.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalThree.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"timeOfClimb"] intValue] == 0) {
               climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"timeOfClimb"] intValue]; 
            }
        }
        if (sortedArray.count<4) {
            //anti-crash
        }
        else{
            _teleopTotalFour.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlFour.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalFour.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"timeOfClimb"] intValue] == 0) {
               climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"timeOfClimb"] intValue]; 
            }
        }
        if (sortedArray.count<5) {
            //anti-crash
        }
        else{
            _teleopTotalFive.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlFive.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalFive.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"timeOfClimb"] intValue] == 0) {
              climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"timeOfClimb"] intValue];  
            }
        }
        if (sortedArray.count<6) {
            //anti-crash
        }
        else{
            _teleopTotalSix.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlSix.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalSix.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"timeOfClimb"] intValue] == 0) {
               climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"timeOfClimb"] intValue]; 
            }
        }
        if (sortedArray.count<7) {
            //anti-crash
        }
        else{
            _teleopTotalSeven.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlSeven.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalSeven.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"timeOfClimb"] intValue] == 0) {
              climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"timeOfClimb"] intValue];  
            }
        }
        if (sortedArray.count<8) {
            //anti-crash
        }
        else{
            _teleopTotalEight.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlEight.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalEight.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"timeOfClimb"] intValue] == 0) {
              climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"timeOfClimb"] intValue];  
            }
        }
        if (sortedArray.count<9) {
            //anti-crash
        }
        else{
            _teleopTotalNine.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlNine.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalNine.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"timeOfClimb"] intValue] == 0) {
              climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"timeOfClimb"] intValue]; 
            }
        }
        if (sortedArray.count<10) {
            //anti-crash
        }
        else{
            _teleopTotalTen.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlTen.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalTen.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"timeOfClimb"] intValue] == 0) {
              climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"timeOfClimb"] intValue]; 
            }
        }
        if (sortedArray.count<11) {
            //anti-crash
        }
        else{
            _teleopTotalEleven.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlEleven.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalEleven.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"timeOfClimb"] intValue] == 0) {
                climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"timeOfClimb"] intValue];
            }
        }
        if (sortedArray.count<12) {
            //anti-crash
        }
        else{
            _teleopTotalTwelve.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlTwelve.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalTwelve.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"timeOfClimb"] intValue] == 0) {
               climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"timeOfClimb"] intValue]; 
            }
        }
        if (sortedArray.count<13) {
            //anti-crash
        }
        else{
            _teleopTotalThirteen.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlThirteen.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalThirteen.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"timeOfClimb"] intValue] == 0) {
               climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"timeOfClimb"] intValue]; 
            }
        }
        if (sortedArray.count<14) {
            //anti-crash
        }
        else{
            _teleopTotalFourteen.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"teleopTotal"]];
            teleopAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"teleopTotal"] intValue];
            _climbLvlFourteen.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"levelClimbedTo"]];
            climbLvlAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"levelClimbedTo"] intValue];
            _autoTotalFourteen.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"autonomousTotal"]];
            autoAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"autonomousTotal"] intValue];
            if (![[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"timeOfClimb"] intValue] == 0) {
               climbTimeAvgIntTotal += [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"timeOfClimb"] intValue]; 
            }
        }
        if (sortedArray.count==0) {
            //anti-crash
        }
        else{
            teleopAvgInt = teleopAvgIntTotal/[sortedArray count];
            climbLvlAvgInt = climbLvlAvgIntTotal/[sortedArray count];
            autoAvgInt = autoAvgIntTotal/[sortedArray count];
            climbTimeAvgInt = climbTimeAvgIntTotal/[sortedArray count];
            _teleopAvg.text = [[NSString alloc] initWithFormat:@"%1.0d", teleopAvgInt];
            _climbLevelAvg.text = [[NSString alloc] initWithFormat:@"%1.0d", climbLvlAvgInt];
            _autoAvg.text = [[NSString alloc] initWithFormat:@"%1.0d", autoAvgInt];
            _climbTimeAvg.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", climbTimeAvgInt/100, climbTimeAvgInt%100];
            teleopAvgIntTotal = 0;
            climbLvlAvgIntTotal = 0;
            autoAvgIntTotal = 0;
            climbTimeAvgIntTotal = 0;
        }
        if (sortedArray.count >0) {
            _detailOne.enabled = TRUE;
            _detailOne.alpha = 1;
        }
        if (sortedArray.count >1) {
            _detailTwo.enabled = TRUE;
            _detailTwo.alpha = 1;
        }
        if (sortedArray.count >2) {
            _detailThree.enabled = TRUE;
            _detailThree.alpha = 1;
        }
        if (sortedArray.count >3) {
            _detailFour.enabled = TRUE;
            _detailFour.alpha = 1;
        }
        if (sortedArray.count >4) {
            _detailFive.enabled = TRUE;
            _detailFive.alpha = 1;
        }
        if (sortedArray.count >5) {
            _detailSix.enabled = TRUE;
            _detailSix.alpha = 1;
        }
        if (sortedArray.count >6) {
            _detailSeven.enabled = TRUE;
            _detailSeven.alpha = 1;
        }
        if (sortedArray.count >7) {
            _detailEight.enabled = TRUE;
            _detailEight.alpha = 1;
        }
        if (sortedArray.count >8) {
            _detailNine.enabled = TRUE;
            _detailNine.alpha = 1;
        }
        if (sortedArray.count >9) {
            _detailTen.enabled = TRUE;
            _detailTen.alpha = 1;
        }
        if (sortedArray.count >10) {
            _detailEleven.enabled = TRUE;
            _detailEleven.alpha = 1;
        }
        if (sortedArray.count >11) {
            _detailTwelve.enabled = TRUE;
            _detailTwelve.alpha = 1;
        }
        if (sortedArray.count >12) {
            _detailThirteen.enabled = TRUE;
            _detailThirteen.alpha = 1;
        }
        if (sortedArray.count >13) {
            _detailFourteen.enabled = TRUE;
            _detailFourteen.alpha = 1;
        }
    }
}

- (IBAction)updateDisplay:(id)sender {
    [self updateMatches];
}

- (IBAction)match1Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:@"Data.plist"]) {
        [[NSFileManager defaultManager] copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"Data" ofType:@"plist"] toPath:path error:nil];
    }
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
            [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
            [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
           // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
            [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
           // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
       // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
            [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
           // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
            [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"1";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:0]]objectForKey:@"defense"]];
}

- (IBAction)match2Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"2";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:1]]objectForKey:@"defense"]];
}

- (IBAction)match3Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"3";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:2]]objectForKey:@"defense"]];
}

- (IBAction)match4Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"4";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:3]]objectForKey:@"defense"]];
}

- (IBAction)match5Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"5";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:4]]objectForKey:@"defense"]];
}

- (IBAction)match6Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"6";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:5]]objectForKey:@"defense"]];
}

- (IBAction)match7Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"7";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:6]]objectForKey:@"defense"]];
}

- (IBAction)match8Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"8";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:7]]objectForKey:@"defense"]];
}

- (IBAction)match9Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"9";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:8]]objectForKey:@"defense"]];
}

- (IBAction)match10Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"10";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:9]]objectForKey:@"defense"]];
}

- (IBAction)match11Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"11";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:10]]objectForKey:@"defense"]];
}

- (IBAction)match12Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"12";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:11]]objectForKey:@"defense"]];
}

- (IBAction)match13Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"13";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:12]]objectForKey:@"defense"]];
}

- (IBAction)match14Details:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *scoutingDirectory = [paths objectAtIndex:0];
    NSString *path = [scoutingDirectory stringByAppendingPathComponent:@"Data.plist"];
    NSMutableDictionary *dataDictD = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSArray *redOneTeamKeys = [[dataDictD objectForKey:@"Red1"] allKeys];
    for (int roneT = 0; roneT < redOneTeamKeys.count; roneT++) {
        NSArray *redOneMatchKeys = [[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]allKeys];
        //NSLog(@"made it to team %@", [redOneTeamKeys objectAtIndex:roneT]);
        for (int roneM = 0; roneM < redOneMatchKeys.count; roneM++) {
            if ([[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] objectForKey:[redOneMatchKeys objectAtIndex:roneM]] == nil) {
                [[dataDictD objectForKey:[redOneTeamKeys objectAtIndex:roneT]] setObject:[[[dataDictD objectForKey:@"Red1"] objectForKey:[redOneTeamKeys objectAtIndex:roneT]]objectForKey:[redOneMatchKeys objectAtIndex:roneM]] forKey:[redOneMatchKeys objectAtIndex:roneM]];
            }
            
            //NSLog(@"made it to match %@", [redOneMatchKeys objectAtIndex:roneM]);
        }
    }
    NSArray *redTwoTeamKeys = [[dataDictD objectForKey:@"Red2"] allKeys];
    for (int rtwoT = 0; rtwoT < redTwoTeamKeys.count; rtwoT++) {
        NSArray *redTwoMatchKeys = [[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]allKeys];
        //NSLog(@"made it to team %@", [redTwoTeamKeys objectAtIndex:rtwoT]);
        for (int rtwoM = 0; rtwoM < redTwoMatchKeys.count; rtwoM++) {
            if ([[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] == nil) {
                [[dataDictD objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]] setObject:[[[dataDictD objectForKey:@"Red2"] objectForKey:[redTwoTeamKeys objectAtIndex:rtwoT]]objectForKey:[redTwoMatchKeys objectAtIndex:rtwoM]] forKey:[redTwoMatchKeys objectAtIndex:rtwoM]];
            }
            //NSLog(@"made it to match %@", [redTwoMatchKeys objectAtIndex:rtwoM]);
        }
    }
    NSArray *redThreeTeamKeys = [[dataDictD objectForKey:@"Red3"] allKeys];
    for (int rthreeT = 0; rthreeT < redThreeTeamKeys.count; rthreeT++) {
        NSArray *redThreeMatchKeys = [[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]allKeys];
        //NSLog(@"made it to team %@", [redThreeTeamKeys objectAtIndex:rthreeT]);
        for (int rthreeM = 0; rthreeM < redThreeMatchKeys.count; rthreeM++) {
            if ([[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] == nil) {
                [[dataDictD objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]] setObject:[[[dataDictD objectForKey:@"Red3"] objectForKey:[redThreeTeamKeys objectAtIndex:rthreeT]]objectForKey:[redThreeMatchKeys objectAtIndex:rthreeM]] forKey:[redThreeMatchKeys objectAtIndex:rthreeM]];
            }
            // NSLog(@"made it to match %@", [redThreeMatchKeys objectAtIndex:rthreeM]);
        }
    }
    NSArray *blueOneTeamKeys = [[dataDictD objectForKey:@"Blue1"] allKeys];
    for (int boneT = 0; boneT < blueOneTeamKeys.count; boneT++) {
        NSArray *blueOneMatchKeys = [[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]allKeys];
        //NSLog(@"made it to team %@", [blueOneTeamKeys objectAtIndex:boneT]);
        for (int boneM = 0; boneM < blueOneMatchKeys.count; boneM++) {
            if ([[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] == nil) {
                [[dataDictD objectForKey:[blueOneTeamKeys objectAtIndex:boneT]] setObject:[[[dataDictD objectForKey:@"Blue1"] objectForKey:[blueOneTeamKeys objectAtIndex:boneT]]objectForKey:[blueOneMatchKeys objectAtIndex:boneM]] forKey:[blueOneMatchKeys objectAtIndex:boneM]];
            }
            // NSLog(@"made it to match %@", [blueOneMatchKeys objectAtIndex:boneM]);
        }
    }
    NSArray *blueTwoTeamKeys = [[dataDictD objectForKey:@"Blue2"] allKeys];
    for (int btwoT = 0; btwoT < blueTwoTeamKeys.count; btwoT++) {
        NSArray *blueTwoMatchKeys = [[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]allKeys];
        // NSLog(@"made it to team %@", [blueTwoTeamKeys objectAtIndex:btwoT]);
        for (int btwoM = 0; btwoM < blueTwoMatchKeys.count; btwoM++) {
            if ([[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] == nil) {
                [[dataDictD objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]] setObject:[[[dataDictD objectForKey:@"Blue2"] objectForKey:[blueTwoTeamKeys objectAtIndex:btwoT]]objectForKey:[blueTwoMatchKeys objectAtIndex:btwoM]] forKey:[blueTwoMatchKeys objectAtIndex:btwoM]];
            }
            // NSLog(@"made it to match %@", [blueTwoMatchKeys objectAtIndex:btwoM]);
        }
    }
    NSArray *blueThreeTeamKeys = [[dataDictD objectForKey:@"Blue3"] allKeys];
    for (int bthreeT = 0; bthreeT < blueThreeTeamKeys.count; bthreeT++) {
        NSArray *blueThreeMatchKeys = [[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]allKeys];
        //NSLog(@"made it to team %@", [blueThreeTeamKeys objectAtIndex:bthreeT]);
        for (int bthreeM = 0; bthreeM < blueThreeMatchKeys.count; bthreeM++) {
            if ([[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] == nil) {
                [[dataDictD objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]] setObject:[[[dataDictD objectForKey:@"Blue3"] objectForKey:[blueThreeTeamKeys objectAtIndex:bthreeT]]objectForKey:[blueThreeMatchKeys objectAtIndex:bthreeM]] forKey:[blueThreeMatchKeys objectAtIndex:bthreeM]];
            }
            //NSLog(@"made it to match %@", [blueThreeMatchKeys objectAtIndex:bthreeM]);
        }
    }
    sortedArray = [[[dataDictD objectForKey:teamNumberSpecifiedStr] allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    _matchXnumber.text = @"14";
    _matchXautoHigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"autoHighMade"]];
    _matchXautoMid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"autoMidMade"]];
    _matchXautoLow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"autoLowMade"]];
    _matchXpyramid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"pyramidShotsMade"]];
    _matchXhigh.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"highShotsMade"]];
    _matchXmid.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"midShotsMade"]];
    _matchXlow.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"lowShotsMade"]];
    _matchXclimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"timeOfClimb"] intValue]/100), ([[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"timeOfClimb"] intValue]%100)];
    _matchXthreePtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"threePtPenalties"]];
    _matchXtwentyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"twentyPtPenalties"]];
    _matchXthirtyPtPenalties.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"thirtyPtPenalties"]];
    _matchXtotalScore.text = [[NSString alloc] initWithFormat:@"%d", [[[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"totalScore"] intValue]];
    _matchXnotes.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"notes"]];
    _matchXscoutInitials.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"scoutName"]];
    _matchXdefense.text = [[NSString alloc] initWithFormat:@"%@", [[[dataDictD objectForKey:teamNumberSpecifiedStr] objectForKey:[sortedArray objectAtIndex:13]]objectForKey:@"defense"]];
}







@end














