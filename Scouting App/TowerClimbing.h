//
//  TowerClimbing.h
//  Scouting App
//
//  Created by Eris on 2/12/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchScouting.h"
#import "GlobalVariables.h"

@interface TowerClimbing : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *mainTimer;
@property (weak, nonatomic) IBOutlet UILabel *levelOne;
@property (weak, nonatomic) IBOutlet UILabel *levelTwo;
@property (weak, nonatomic) IBOutlet UILabel *levelThree;
@property (weak, nonatomic) IBOutlet UILabel *levelOneTime;
@property (weak, nonatomic) IBOutlet UILabel *levelTwoTime;
@property (weak, nonatomic) IBOutlet UILabel *levelThreeTime;
@property (weak, nonatomic) IBOutlet UIButton *levelOneEnabler;
@property (weak, nonatomic) IBOutlet UIButton *levelTwoEnabler;
@property (weak, nonatomic) IBOutlet UIButton *levelThreeEnabler;

@property int seconds;



@end
