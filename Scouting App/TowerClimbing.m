//
//  TowerClimbing.m
//  Scouting App
//
//  Created by Eris on 2/12/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import "TowerClimbing.h"
#import "MatchScouting.h"

@interface TowerClimbing ()

@property NSTimer *timer;

- (void) addOneSecond:(NSTimer *)t;

@end

@implementation TowerClimbing

NSInteger levelClimbedTo = 0;
NSInteger timeOfClimb = 0;
NSInteger levelOneClimbTime = 0;
NSInteger levelTwoClimbTime = 0;
NSInteger levelThreeClimbTime = 0;
NSInteger climbFailCount = 0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _seconds = 0;
        // Custom initialization
    }
    return self;
}
- (void) addOneSecond:(NSTimer *)t{
    _seconds++;
    _mainTimer.text = [[NSString alloc] initWithFormat:@"%d : %d",
                       _seconds/100, _seconds%100];
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
- (IBAction)startStop:(UIButton *)sender {
    _levelTwoEnabler.enabled = 0;
    _levelThreeEnabler.enabled = 0;
    if(sender.isSelected){
        [_timer invalidate];
        _levelOneEnabler.enabled = NO;
        _levelTwoEnabler.enabled = NO;
        _levelThreeEnabler.enabled = NO;
    }
    else{
        _timer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(addOneSecond:) userInfo:nil repeats:YES];
        _levelOneEnabler.enabled = YES;
    }
        sender.selected = !sender.isSelected;
}
- (IBAction)levelOneTimestamp:(id)sender {
    levelClimbedTo = 1;
    timeOfClimb = _seconds;
    levelOneClimbTime = _seconds;
    _levelOne.alpha = 1;
    _levelOneTime.alpha = 1;
    _levelTwoEnabler.enabled = YES;
    _levelOne.hidden = NO;
    _levelOneTime.hidden = NO;
    _levelOneTime.text = [[NSString alloc] initWithFormat: @"%d : %d", _seconds/100, _seconds%100];
    _levelOneEnabler.enabled = NO;
}
- (IBAction)levelTwoTimestamp:(id)sender {
    levelClimbedTo = 2;
    timeOfClimb = _seconds;
    levelTwoClimbTime = _seconds;
    _levelTwo.alpha = 1;
    _levelTwoTime.alpha = 1;
    _levelThreeEnabler.enabled = YES;
    _levelTwo.hidden = NO;
    _levelTwoTime.hidden = NO;
    _levelTwoTime.text = [[NSString alloc] initWithFormat: @"%d : %d", _seconds/100, _seconds%100];
    _levelTwoEnabler.enabled = NO;
}
- (IBAction)levelThreeTimestamp:(id)sender {
    levelClimbedTo = 3;
    timeOfClimb = _seconds;
    levelThreeClimbTime = _seconds;
    _levelThree.alpha = 1;
    _levelThreeTime.alpha = 1;
    _levelThree.hidden = NO;
    _levelThreeTime.hidden = NO;
    _levelThreeTime.text = [[NSString alloc] initWithFormat: @"%d : %d", _seconds/100, _seconds%100];
    [_timer invalidate];
    _levelThreeEnabler.enabled = NO;
}
- (IBAction)failedClimb:(id)sender {
    [_timer invalidate];
    levelClimbedTo = 0;
    timeOfClimb = 0;
    _seconds = 0;
    _levelOne.alpha = 0;
    _levelOneTime.alpha = 0;
    _levelTwo.alpha = 0;
    _levelTwoTime.alpha = 0;
    _levelThree.alpha = 0;
    _levelThreeTime.alpha = 0;
    _mainTimer.text = [[NSString alloc] initWithFormat: @"00 : 00"];
    climbFailCount++;
}
- (IBAction)newMatch:(id)sender {
    levelClimbedTo = 0;
    timeOfClimb = 0;
    _seconds = 0;
    _levelOne.alpha = 0;
    _levelOneTime.alpha = 0;
    _levelTwo.alpha = 0;
    _levelTwoTime.alpha = 0;
    _levelThree.alpha = 0;
    _levelThreeTime.alpha = 0;
    _mainTimer.text = @"00 : 00";
}

@end












