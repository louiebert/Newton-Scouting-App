//
//  DataPage.h
//  KC Match Scouting App
//
//  Created by Eris on 3/10/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalVariables.h"


@interface DataPage : UIViewController 

@property (weak, nonatomic) IBOutlet UITextField *teamNumberInputD;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalOne;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlOne;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalOne;
@property (weak, nonatomic) IBOutlet UIButton *detailOne;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalTwo;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlTwo;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalTwo;
@property (weak, nonatomic) IBOutlet UIButton *detailTwo;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalThree;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlThree;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalThree;
@property (weak, nonatomic) IBOutlet UIButton *detailThree;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalFour;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlFour;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalFour;
@property (weak, nonatomic) IBOutlet UIButton *detailFour;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalFive;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlFive;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalFive;
@property (weak, nonatomic) IBOutlet UIButton *detailFive;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalSix;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlSix;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalSix;
@property (weak, nonatomic) IBOutlet UIButton *detailSix;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalSeven;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlSeven;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalSeven;
@property (weak, nonatomic) IBOutlet UIButton *detailSeven;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalEight;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlEight;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalEight;
@property (weak, nonatomic) IBOutlet UIButton *detailEight;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalNine;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlNine;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalNine;
@property (weak, nonatomic) IBOutlet UIButton *detailNine;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalTen;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlTen;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalTen;
@property (weak, nonatomic) IBOutlet UIButton *detailTen;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalEleven;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlEleven;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalEleven;
@property (weak, nonatomic) IBOutlet UIButton *detailEleven;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalTwelve;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlTwelve;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalTwelve;
@property (weak, nonatomic) IBOutlet UIButton *detailTwelve;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalThirteen;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlThirteen;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalThirteen;
@property (weak, nonatomic) IBOutlet UIButton *detailThirteen;

@property (weak, nonatomic) IBOutlet UILabel *teleopTotalFourteen;
@property (weak, nonatomic) IBOutlet UILabel *climbLvlFourteen;
@property (weak, nonatomic) IBOutlet UILabel *autoTotalFourteen;
@property (weak, nonatomic) IBOutlet UIButton *detailFourteen;

@property (weak, nonatomic) IBOutlet UILabel *teleopAvg;
@property (weak, nonatomic) IBOutlet UILabel *autoAvg;
@property (weak, nonatomic) IBOutlet UILabel *climbLevelAvg;
@property (weak, nonatomic) IBOutlet UILabel *climbTimeAvg;

@property (weak, nonatomic) IBOutlet UILabel *matchXnumber;
@property (weak, nonatomic) IBOutlet UILabel *matchXscoutInitials;
@property (weak, nonatomic) IBOutlet UILabel *matchXautoHigh;
@property (weak, nonatomic) IBOutlet UILabel *matchXautoMid;
@property (weak, nonatomic) IBOutlet UILabel *matchXautoLow;
@property (weak, nonatomic) IBOutlet UILabel *matchXpyramid;
@property (weak, nonatomic) IBOutlet UILabel *matchXhigh;
@property (weak, nonatomic) IBOutlet UILabel *matchXmid;
@property (weak, nonatomic) IBOutlet UILabel *matchXlow;
@property (weak, nonatomic) IBOutlet UILabel *matchXclimbTime;
@property (weak, nonatomic) IBOutlet UILabel *matchXthreePtPenalties;
@property (weak, nonatomic) IBOutlet UILabel *matchXtwentyPtPenalties;
@property (weak, nonatomic) IBOutlet UILabel *matchXthirtyPtPenalties;
@property (weak, nonatomic) IBOutlet UILabel *matchXtotalScore;
@property (weak, nonatomic) IBOutlet UILabel *matchXnotes;
@property (weak, nonatomic) IBOutlet UILabel *matchXdefense;




-(void)updateMatches;



@end
