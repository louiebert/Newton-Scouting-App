//
//  Strategy.m
//  KC Match Scouting App
//
//  Created by Eris on 3/13/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import "Strategy.h"
#import "GlobalVariables.h"

@interface Strategy ()

@end

@implementation Strategy

NSArray *sortedArray;

NSInteger driventotalAuto = 0;
NSInteger driventotalAutoM = 0;
NSInteger driventotalTeleop = 0;
NSInteger driventotalTeleopA = 0;
NSInteger driventotalTeleopM = 0;
NSInteger driventotalPyramidS = 0;
NSInteger driventotalPyramidSM = 0;
NSInteger driventotalPyramidLvl = 0;
NSInteger driventotalClimbTime = 0;
NSInteger driventotalPenalties = 0;

NSInteger gAlliance1 = 0;
NSInteger g1totalAuto = 0;
NSInteger g1totalAutoM = 0;
NSInteger g1totalTeleop = 0;
NSInteger g1totalTeleopA = 0;
NSInteger g1totalTeleopM = 0;
NSInteger g1totalPyramidS = 0;
NSInteger g1totalPyramidSM = 0;
NSInteger g1totalPyramidLvl = 0;
NSInteger g1totalClimbTime = 0;
NSInteger g1totalPenalties = 0;

NSInteger gAlliance2 = 0;
NSInteger g2totalAuto = 0;
NSInteger g2totalAutoM = 0;
NSInteger g2totalTeleop = 0;
NSInteger g2totalTeleopA = 0;
NSInteger g2totalTeleopM = 0;
NSInteger g2totalPyramidS = 0;
NSInteger g2totalPyramidSM = 0;
NSInteger g2totalPyramidLvl = 0;
NSInteger g2totalClimbTime = 0;
NSInteger g2totalPenalties = 0;

NSInteger bAlliance1 = 0;
NSInteger b1totalAuto = 0;
NSInteger b1totalAutoM = 0;
NSInteger b1totalTeleop = 0;
NSInteger b1totalTeleopA = 0;
NSInteger b1totalTeleopM = 0;
NSInteger b1totalPyramidS = 0;
NSInteger b1totalPyramidSM = 0;
NSInteger b1totalPyramidLvl = 0;
NSInteger b1totalClimbTime = 0;
NSInteger b1totalPenalties = 0;

NSInteger bAlliance2 = 0;
NSInteger b2totalAuto = 0;
NSInteger b2totalAutoM = 0;
NSInteger b2totalTeleop = 0;
NSInteger b2totalTeleopA = 0;
NSInteger b2totalTeleopM = 0;
NSInteger b2totalPyramidS = 0;
NSInteger b2totalPyramidSM = 0;
NSInteger b2totalPyramidLvl = 0;
NSInteger b2totalClimbTime = 0;
NSInteger b2totalPenalties = 0;

NSInteger bAlliance3 = 0;
NSInteger b3totalAuto = 0;
NSInteger b3totalAutoM = 0;
NSInteger b3totalTeleop = 0;
NSInteger b3totalTeleopA = 0;
NSInteger b3totalTeleopM = 0;
NSInteger b3totalPyramidS = 0;
NSInteger b3totalPyramidSM = 0;
NSInteger b3totalPyramidLvl = 0;
NSInteger b3totalClimbTime = 0;
NSInteger b3totalPenalties = 0;

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


- (IBAction)updateBtn:(id)sender {
    driventotalAuto = 0;
    driventotalAutoM = 0;
    driventotalTeleop = 0;
    driventotalTeleopA = 0;
    driventotalTeleopM = 0;
    driventotalPyramidS = 0;
    driventotalPyramidSM = 0;
    driventotalPyramidLvl = 0;
    driventotalClimbTime = 0;
    driventotalPenalties = 0;
    
    gAlliance1 = 0;
    g1totalAuto = 0;
    g1totalAutoM = 0;
    g1totalTeleop = 0;
    g1totalTeleopA = 0;
    g1totalTeleopM = 0;
    g1totalPyramidS = 0;
    g1totalPyramidSM = 0;
    g1totalPyramidLvl = 0;
    g1totalClimbTime = 0;
    g1totalPenalties = 0;
    
    gAlliance2 = 0;
    g2totalAuto = 0;
    g2totalAutoM = 0;
    g2totalTeleop = 0;
    g2totalTeleopA = 0;
    g2totalTeleopM = 0;
    g2totalPyramidS = 0;
    g2totalPyramidSM = 0;
    g2totalPyramidLvl = 0;
    g2totalClimbTime = 0;
    g2totalPenalties = 0;
    
    bAlliance1 = 0;
    b1totalAuto = 0;
    b1totalAutoM = 0;
    b1totalTeleop = 0;
    b1totalTeleopA = 0;
    b1totalTeleopM = 0;
    b1totalPyramidS = 0;
    b1totalPyramidSM = 0;
    b1totalPyramidLvl = 0;
    b1totalClimbTime = 0;
    b1totalPenalties = 0;
    
    bAlliance2 = 0;
    b2totalAuto = 0;
    b2totalAutoM = 0;
    b2totalTeleop = 0;
    b2totalTeleopA = 0;
    b2totalTeleopM = 0;
    b2totalPyramidS = 0;
    b2totalPyramidSM = 0;
    b2totalPyramidLvl = 0;
    b2totalClimbTime = 0;
    b2totalPenalties = 0;
    
    bAlliance3 = 0;
    b3totalAuto = 0;
    b3totalAutoM = 0;
    b3totalTeleop = 0;
    b3totalTeleopA = 0;
    b3totalTeleopM = 0;
    b3totalPyramidS = 0;
    b3totalPyramidSM = 0;
    b3totalPyramidLvl = 0;
    b3totalClimbTime = 0;
    b3totalPenalties = 0;
    
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
    NSLog(@"checkpoint2");
    if ([dataDictD objectForKey:_ourAllianceField1.text] == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"BAD TEAM NUMBER"
                                                       message: @"Please enter a valid team number for this regional in the first text field for our alliance."
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    if ([dataDictD objectForKey:_ourAllianceField2.text] == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"BAD TEAM NUMBER"
                                                       message: @"Please enter a valid team number for this regional in the second text field for our alliance."
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    if ([dataDictD objectForKey:_theirAllianceField1.text] == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"BAD TEAM NUMBER"
                                                       message: @"Please enter a valid team number for this regional in the first text field for their alliance."
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    if ([dataDictD objectForKey:_theirAllianceField2.text] == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"BAD TEAM NUMBER"
                                                       message: @"Please enter a valid team number for this regional in the second text field for their alliance."
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    if ([dataDictD objectForKey:_theirAllianceField3.text] == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"BAD TEAM NUMBER"
                                                       message: @"Please enter a valid team number for this regional in the third text field for their alliance."
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [alert show];
    }
    else{
        gAlliance1 = [_ourAllianceField1.text intValue];
        gAlliance2 = [_ourAllianceField2.text intValue];
        bAlliance1 = [_theirAllianceField1.text intValue];
        bAlliance2 = [_theirAllianceField2.text intValue];
        bAlliance3 = [_theirAllianceField3.text intValue];
        
        NSArray *drivenMatchKeys = [[dataDictD objectForKey:@"1730"] allKeys];
        for (int drivenM = 0; drivenM < drivenMatchKeys.count; drivenM++) {
            driventotalAuto += [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"autoHighMade"] intValue]*6 + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"autoMidMade"] intValue]*4 + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"autoLowMade"] intValue]*2;
            NSLog(@"%d", driventotalAuto);
            driventotalAutoM += [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"autoHighMisses"] intValue] + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"autoMidMisses"] intValue] + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"autoLowMisses"] intValue];
            driventotalTeleop += [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"highShotsMade"] intValue]*3 + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"midShotsMade"] intValue]*2 + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"lowShotsMade"] intValue];
            driventotalTeleopA += [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"highShotsMade"] intValue] + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"midShotsMade"] intValue] + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"lowShotsMade"] intValue] + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"lowMisses"] intValue];
            driventotalTeleopM += [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"lowMisses"] intValue];
            driventotalPyramidS += [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"pyramidShotsMade"] intValue];
            driventotalPyramidSM += [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"pyramidMisses"] intValue];
            driventotalPyramidLvl += [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"levelClimbedTo"] intValue];
            driventotalClimbTime += [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"timeOfClimb"] intValue];
            driventotalPenalties += [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"threePtPenalties"] intValue] + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"twentyPtPenalties"] intValue] + [[[[dataDictD objectForKey:@"1730"] objectForKey:[drivenMatchKeys objectAtIndex:drivenM]] objectForKey:@"thirtyPtPenalties"] intValue];
        }
        NSArray *gOneMatchKeys = [[dataDictD objectForKey:_ourAllianceField1.text] allKeys];
        for (int gOneM = 0; gOneM < gOneMatchKeys.count; gOneM++) {
            g1totalAuto += [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"autoHighMade"] intValue]*6 + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"autoMidMade"] intValue]*4 + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"autoLowMade"] intValue]*2;
            g1totalAutoM += [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"autoHighMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"autoMidMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"autoLowMisses"] intValue];
            g1totalTeleop += [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"highShotsMade"] intValue]*3 + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"midShotsMade"] intValue]*2 + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"lowShotsMade"] intValue];
            g1totalTeleopA += [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"highShotsMade"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"midShotsMade"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"lowShotsMade"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"lowMisses"] intValue];
            g1totalTeleopM += [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"lowMisses"] intValue];
            g1totalPyramidS += [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"pyramidShotsMade"] intValue];
            g1totalPyramidSM += [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"pyramidMisses"] intValue];
            g1totalPyramidLvl += [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"levelClimbedTo"] intValue];
            g1totalClimbTime += [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"timeOfClimb"] intValue];
            g1totalPenalties += [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"threePtPenalties"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"twentyPtPenalties"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField1.text] objectForKey:[gOneMatchKeys objectAtIndex:gOneM]] objectForKey:@"thirtyPtPenalties"] intValue];
        }
        NSArray *gTwoMatchKeys = [[dataDictD objectForKey:_ourAllianceField2.text] allKeys];
        for (int gTwoM = 0; gTwoM < gTwoMatchKeys.count; gTwoM++) {
            g2totalAuto += [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"autoHighMade"] intValue]*6 + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"autoMidMade"] intValue]*4 + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"autoLowMade"] intValue]*2;
            g2totalAutoM += [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"autoHighMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"autoMidMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"autoLowMisses"] intValue];
            g2totalTeleop += [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"highShotsMade"] intValue]*3 + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"midShotsMade"] intValue]*2 + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"lowShotsMade"] intValue];
            g2totalTeleopA += [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"highShotsMade"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"midShotsMade"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"lowShotsMade"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"lowMisses"] intValue];
            g2totalTeleopM += [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"lowMisses"] intValue];
            g2totalPyramidS += [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"pyramidShotsMade"] intValue];
            g2totalPyramidSM += [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"pyramidMisses"] intValue];
            g2totalPyramidLvl += [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"levelClimbedTo"] intValue];
            g2totalClimbTime += [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"timeOfClimb"] intValue];
            g2totalPenalties += [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"threePtPenalties"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"twentyPtPenalties"] intValue] + [[[[dataDictD objectForKey:_ourAllianceField2.text] objectForKey:[gTwoMatchKeys objectAtIndex:gTwoM]] objectForKey:@"thirtyPtPenalties"] intValue];
        }
        NSArray *bOneMatchKeys = [[dataDictD objectForKey:_theirAllianceField1.text] allKeys];
        for (int bOneM = 0; bOneM < bOneMatchKeys.count; bOneM++) {
            b1totalAuto += [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"autoHighMade"] intValue]*6 + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"autoMidMade"] intValue]*4 + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"autoLowMade"] intValue]*2;
            b1totalAutoM += [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"autoHighMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"autoMidMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"autoLowMisses"] intValue];
            b1totalTeleop += [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"highShotsMade"] intValue]*3 + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"midShotsMade"] intValue]*2 + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"lowShotsMade"] intValue];
            b1totalTeleopA += [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"highShotsMade"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"midShotsMade"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"lowShotsMade"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"lowMisses"] intValue];
            b1totalTeleopM += [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"lowMisses"] intValue];
            b1totalPyramidS += [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"pyramidShotsMade"] intValue];
            b1totalPyramidSM += [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"pyramidMisses"] intValue];
            b1totalPyramidLvl += [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"levelClimbedTo"] intValue];
            b1totalClimbTime += [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"timeOfClimb"] intValue];
            b1totalPenalties += [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"threePtPenalties"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"twentyPtPenalties"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField1.text] objectForKey:[bOneMatchKeys objectAtIndex:bOneM]] objectForKey:@"thirtyPtPenalties"] intValue];
        }
        NSArray *bTwoMatchKeys = [[dataDictD objectForKey:_theirAllianceField2.text] allKeys];
        for (int bTwoM = 0; bTwoM < bTwoMatchKeys.count; bTwoM++) {
            b2totalAuto += [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"autoHighMade"] intValue]*6 + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"autoMidMade"] intValue]*4 + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"autoLowMade"] intValue]*2;
            b2totalAutoM += [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"autoHighMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"autoMidMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"autoLowMisses"] intValue];
            b2totalTeleop += [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"highShotsMade"] intValue]*3 + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"midShotsMade"] intValue]*2 + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"lowShotsMade"] intValue];
            b2totalTeleopA += [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"highShotsMade"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"midShotsMade"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"lowShotsMade"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"lowMisses"] intValue];
            b2totalTeleopM += [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"lowMisses"] intValue];
            b2totalPyramidS += [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"pyramidShotsMade"] intValue];
            b2totalPyramidSM += [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"pyramidMisses"] intValue];
            b2totalPyramidLvl += [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"levelClimbedTo"] intValue];
            b2totalClimbTime += [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"timeOfClimb"] intValue];
            b2totalPenalties += [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"threePtPenalties"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"twentyPtPenalties"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField2.text] objectForKey:[bTwoMatchKeys objectAtIndex:bTwoM]] objectForKey:@"thirtyPtPenalties"] intValue];
        }
        NSArray *bThreeMatchKeys = [[dataDictD objectForKey:_theirAllianceField3.text] allKeys];
        for (int bThreeM = 0; bThreeM < bThreeMatchKeys.count; bThreeM++) {
            b3totalAuto += [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"autoHighMade"] intValue]*6 + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"autoMidMade"] intValue]*4 + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"autoLowMade"] intValue]*2;
            b3totalAutoM += [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"autoHighMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"autoMidMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"autoLowMisses"] intValue];
            b3totalTeleop += [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"highShotsMade"] intValue]*3 + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"midShotsMade"] intValue]*2 + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"lowShotsMade"] intValue];
            b3totalTeleopA += [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"highShotsMade"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"midShotsMade"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"lowShotsMade"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"lowMisses"] intValue];;
            b3totalTeleopM += [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"highMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"midMisses"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"lowMisses"] intValue];
            b3totalPyramidS += [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"pyramidShotsMade"] intValue];
            b3totalPyramidSM += [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"pyramidMisses"] intValue];
            b3totalPyramidLvl += [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"levelClimbedTo"] intValue];
            b3totalClimbTime += [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"timeOfClimb"] intValue];
            b3totalPenalties += [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"threePtPenalties"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"twentyPtPenalties"] intValue] + [[[[dataDictD objectForKey:_theirAllianceField3.text] objectForKey:[bThreeMatchKeys objectAtIndex:bThreeM]] objectForKey:@"thirtyPtPenalties"] intValue];
        }
        if (drivenMatchKeys.count == 0) {
            _drivenAvgAuto.text = @"0";
            _drivenAvgAutoM.text = @"0";
            _drivenAvgTeleop.text = @"0";
            _drivenAvgTeleopA.text = @"0";
            _drivenAvgTeleopM.text = @"0";
            _drivenAvgPyramidShots.text = @"0";
            _drivenAvgPyramidShotsM.text = @"0";
            _drivenAvgPyramidLvl.text = @"0";
            _drivenAvgClimbTime.text = @"(00 : 00)";
            _drivenTotalPenalties.text = @"0";
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"NO MATCHES"
                                                           message: @"There are no recorded matches for Team Driven yet."
                                                          delegate: self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            [alert show];
        }
        else{
            _drivenAvgAuto.text = [[NSString alloc] initWithFormat:@"%1.0d", (driventotalAuto/drivenMatchKeys.count)];
            _drivenAvgAutoM.text = [[NSString alloc] initWithFormat:@"%1.0d", (driventotalAutoM/drivenMatchKeys.count)];
            _drivenAvgTeleop.text = [[NSString alloc] initWithFormat:@"%1.0d", (driventotalTeleop/drivenMatchKeys.count)];
            _drivenAvgTeleopA.text = [[NSString alloc] initWithFormat:@"%1.0d", (driventotalTeleopA/drivenMatchKeys.count)];
            _drivenAvgTeleopM.text = [[NSString alloc] initWithFormat:@"%1.0d", (driventotalTeleopM/drivenMatchKeys.count)];
            _drivenAvgPyramidShots.text = [[NSString alloc] initWithFormat:@"%1.0d", (driventotalPyramidS/drivenMatchKeys.count)];
            _drivenAvgPyramidShotsM.text = [[NSString alloc] initWithFormat:@"%1.0d", (driventotalPyramidSM/drivenMatchKeys.count)];
            _drivenAvgPyramidLvl.text = [[NSString alloc] initWithFormat:@"%1.0d", (driventotalPyramidLvl/drivenMatchKeys.count)];
            _drivenAvgClimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ((driventotalClimbTime/drivenMatchKeys.count)/100), ((driventotalClimbTime/drivenMatchKeys.count)%100)];
            _drivenTotalPenalties.text = [[NSString alloc] initWithFormat:@"%d", driventotalPenalties];
        }
        if (gOneMatchKeys.count == 0) {
            _g1AvgAuto.text = @"0";
            _g1AvgAutoM.text = @"0";
            _g1AvgTeleop.text = @"0";
            _g1AvgTeleopA.text = @"0";
            _g1AvgTeleopM.text = @"0";
            _g1AvgPyramidShots.text = @"0";
            _g1AvgPyramidShotsM.text = @"0";
            _g1AvgPyramidLvl.text = @"0";
            _g1AvgClimbTime.text = @"(00 : 00)";
            _g1TotalPenalties.text = @"0";
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"NO MATCHES"
                                                           message: @"There are no recorded matches for the team number in the first text field for our alliance."
                                                          delegate: self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            [alert show];
        }
        else{
            _g1AvgAuto.text = [[NSString alloc] initWithFormat:@"%1.0d", (g1totalAuto/gOneMatchKeys.count)];
            _g1AvgAutoM.text = [[NSString alloc] initWithFormat:@"%1.0d", (g1totalAutoM/gOneMatchKeys.count)];
            _g1AvgTeleop.text = [[NSString alloc] initWithFormat:@"%1.0d", (g1totalTeleop/gOneMatchKeys.count)];
            _g1AvgTeleopA.text = [[NSString alloc] initWithFormat:@"%1.0d", (g1totalTeleopA/gOneMatchKeys.count)];
            _g1AvgTeleopM.text = [[NSString alloc] initWithFormat:@"%1.0d", (g1totalTeleopM/gOneMatchKeys.count)];
            _g1AvgPyramidShots.text = [[NSString alloc] initWithFormat:@"%1.0d", (g1totalPyramidS/gOneMatchKeys.count)];
            _g1AvgPyramidShotsM.text = [[NSString alloc] initWithFormat:@"%1.0d", (g1totalPyramidSM/gOneMatchKeys.count)];
            _g1AvgPyramidLvl.text = [[NSString alloc] initWithFormat:@"%1.0d", (g1totalPyramidLvl/bOneMatchKeys.count)];
            _g1AvgClimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ((g1totalClimbTime/gOneMatchKeys.count)/100), ((g1totalClimbTime/gOneMatchKeys.count)%100)];
            _g1TotalPenalties.text = [[NSString alloc] initWithFormat:@"%d", g1totalPenalties];
        }
        
        if (gTwoMatchKeys.count == 0) {
            _g2AvgAuto.text = @"0";
            _g2AvgAutoM.text = @"0";
            _g2AvgTeleop.text = @"0";
            _g2AvgTeleopA.text = @"0";
            _g2AvgTeleopM.text = @"0";
            _g2AvgPyramidShots.text = @"0";
            _g2AvgPyramidShotsM.text = @"0";
            _g2AvgPyramidLvl.text = @"0";
            _g2AvgClimbTime.text = @"(00 : 00)";
            _g2TotalPenalties.text = @"0";
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"NO MATCHES"
                                                           message: @"There are no recorded matches for the team number in the second text field for our alliance."
                                                          delegate: self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            [alert show];
        }
        else{
            _g2AvgAuto.text = [[NSString alloc] initWithFormat:@"%1.0d", (g2totalAuto/gTwoMatchKeys.count)];
            _g2AvgAutoM.text = [[NSString alloc] initWithFormat:@"%1.0d", (g2totalAutoM/gTwoMatchKeys.count)];
            _g2AvgTeleop.text = [[NSString alloc] initWithFormat:@"%1.0d", (g2totalTeleop/gTwoMatchKeys.count)];
            _g2AvgTeleopA.text = [[NSString alloc] initWithFormat:@"%1.0d", (g2totalTeleopA/gTwoMatchKeys.count)];
            _g2AvgTeleopM.text = [[NSString alloc] initWithFormat:@"%1.0d", (g2totalTeleopM/gTwoMatchKeys.count)];
            _g2AvgPyramidShots.text = [[NSString alloc] initWithFormat:@"%1.0d", (g2totalPyramidS/gTwoMatchKeys.count)];
            _g2AvgPyramidShotsM.text = [[NSString alloc] initWithFormat:@"%1.0d", (g1totalPyramidSM/gTwoMatchKeys.count)];
            _g2AvgPyramidLvl.text = [[NSString alloc] initWithFormat:@"%1.0d", (g2totalPyramidLvl/gTwoMatchKeys.count)];
            _g2AvgClimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ((g2totalClimbTime/gOneMatchKeys.count)/100), ((g2totalClimbTime/gOneMatchKeys.count)%100)];
            _g2TotalPenalties.text = [[NSString alloc] initWithFormat:@"%d", g2totalPenalties];
        }
        
        if (bOneMatchKeys.count == 0) {
            _b1AvgAuto.text = @"0";
            _b1AvgAutoM.text = @"0";
            _b1AvgTeleop.text = @"0";
            _b1AvgTeleopA.text = @"0";
            _b1AvgTeleopM.text = @"0";
            _b1AvgPyramidShots.text = @"0";
            _b1AvgPyramidShotsM.text = @"0";
            _b1AvgPyramidLvl.text = @"0";
            _b1AvgClimbTime.text = @"(00 : 00)";
            _b1TotalPenalties.text = @"0";
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"NO MATCHES"
                                                           message: @"There are no recorded matches for the team number in the first text field for their alliance."
                                                          delegate: self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            [alert show];
        }
        else{
            _b1AvgAuto.text = [[NSString alloc] initWithFormat:@"%1.0d", (b1totalAuto/bOneMatchKeys.count)];
            _b1AvgAutoM.text = [[NSString alloc] initWithFormat:@"%1.0d", (b1totalAutoM/bOneMatchKeys.count)];
            _b1AvgTeleop.text = [[NSString alloc] initWithFormat:@"%1.0d", (b1totalTeleop/bOneMatchKeys.count)];
            _b1AvgTeleopA.text = [[NSString alloc] initWithFormat:@"%1.0d", (b1totalTeleopA/bOneMatchKeys.count)];
            _b1AvgTeleopM.text = [[NSString alloc] initWithFormat:@"%1.0d", (b1totalTeleopM/bOneMatchKeys.count)];
            _b1AvgPyramidShots.text = [[NSString alloc] initWithFormat:@"%1.0d", (b1totalPyramidS/bOneMatchKeys.count)];
            _b1AvgPyramidShotsM.text = [[NSString alloc] initWithFormat:@"%1.0d", (b1totalPyramidSM/bOneMatchKeys.count)];
            _b1AvgPyramidLvl.text = [[NSString alloc] initWithFormat:@"%1.0d", (b1totalPyramidLvl/bOneMatchKeys.count)];
            _b1AvgClimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ((b1totalClimbTime/gOneMatchKeys.count)/100), ((b1totalClimbTime/gOneMatchKeys.count)%100)];
            _b1TotalPenalties.text = [[NSString alloc] initWithFormat:@"%d", b1totalPenalties];
        }
        
        if (bTwoMatchKeys.count == 0) {
            _b2AvgAuto.text = @"0";
            _b2AvgAutoM.text = @"0";
            _b2AvgTeleop.text = @"0";
            _b2AvgTeleopA.text = @"0";
            _b2AvgTeleopM.text = @"0";
            _b2AvgPyramidShots.text = @"0";
            _b2AvgPyramidShotsM.text = @"0";
            _b2AvgPyramidLvl.text = @"0";
            _b2AvgClimbTime.text = @"(00 : 00)";
            _b2TotalPenalties.text = @"0";
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"NO MATCHES"
                                                           message: @"There are no recorded matches for the team number in the second text field for their alliance."
                                                          delegate: self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            [alert show];
        }
        else{
            _b2AvgAuto.text = [[NSString alloc] initWithFormat:@"%1.0d", (b2totalAuto/bTwoMatchKeys.count)];
            _b2AvgAutoM.text = [[NSString alloc] initWithFormat:@"%1.0d", (b2totalAutoM/bTwoMatchKeys.count)];
            _b2AvgTeleop.text = [[NSString alloc] initWithFormat:@"%1.0d", (b2totalTeleop/bTwoMatchKeys.count)];
            _b2AvgTeleopA.text = [[NSString alloc] initWithFormat:@"%1.0d", (b2totalTeleopA/bTwoMatchKeys.count)];
            _b2AvgTeleopM.text = [[NSString alloc] initWithFormat:@"%1.0d", (b2totalTeleopM/bTwoMatchKeys.count)];
            _b2AvgPyramidShots.text = [[NSString alloc] initWithFormat:@"%1.0d", (b2totalPyramidS/bTwoMatchKeys.count)];
            _b2AvgPyramidShotsM.text = [[NSString alloc] initWithFormat:@"%1.0d", (b1totalPyramidSM/bTwoMatchKeys.count)];
            _b2AvgPyramidLvl.text = [[NSString alloc] initWithFormat:@"%1.0d", (b2totalPyramidLvl/bTwoMatchKeys.count)];
            _b2AvgClimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ((b2totalClimbTime/gOneMatchKeys.count)/100), ((b2totalClimbTime/gOneMatchKeys.count)%100)];
            _b2TotalPenalties.text = [[NSString alloc] initWithFormat:@"%d", b2totalPenalties];
        }
        
        if (bThreeMatchKeys.count == 0) {
            _b3AvgAuto.text = @"0";
            _b3AvgAutoM.text = @"0";
            _b3AvgTeleop.text = @"0";
            _b3AvgTeleopA.text = @"0";
            _b3AvgTeleopM.text = @"0";
            _b3AvgPyramidShots.text = @"0";
            _b3AvgPyramidShotsM.text = @"0";
            _b3AvgPyramidLvl.text = @"0";
            _b3AvgClimbTime.text = @"(00 : 00)";
            _b3TotalPenalties.text = @"0";
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"NO MATCHES"
                                                           message: @"There are no recorded matches for the team number in the third text field for their alliance."
                                                          delegate: self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            [alert show];
        }
        else{
            _b3AvgAuto.text = [[NSString alloc] initWithFormat:@"%1.0d", (b3totalAuto/bThreeMatchKeys.count)];
            _b3AvgAutoM.text = [[NSString alloc] initWithFormat:@"%1.0d", (b3totalAutoM/bThreeMatchKeys.count)];
            _b3AvgTeleop.text = [[NSString alloc] initWithFormat:@"%1.0d", (b3totalTeleop/bThreeMatchKeys.count)];
            _b3AvgTeleopA.text = [[NSString alloc] initWithFormat:@"%1.0d", (b3totalTeleopA/bThreeMatchKeys.count)];
            _b3AvgTeleopM.text = [[NSString alloc] initWithFormat:@"%1.0d", (b3totalTeleopM/bThreeMatchKeys.count)];
            _b3AvgPyramidShots.text = [[NSString alloc] initWithFormat:@"%1.0d", (b3totalPyramidS/bThreeMatchKeys.count)];
            _b3AvgPyramidShotsM.text = [[NSString alloc] initWithFormat:@"%1.0d", (b1totalPyramidSM/bThreeMatchKeys.count)];
            _b3AvgPyramidLvl.text = [[NSString alloc] initWithFormat:@"%1.0d", (b3totalPyramidLvl/bThreeMatchKeys.count)];
            _b3AvgClimbTime.text = [[NSString alloc] initWithFormat:@"(%1.0d : %1.0d)", ((b3totalClimbTime/gOneMatchKeys.count)/100), ((b3totalClimbTime/gOneMatchKeys.count)%100)];
            _b3TotalPenalties.text = [[NSString alloc] initWithFormat:@"%d", b3totalPenalties];
        }
    }
    
}

















@end
