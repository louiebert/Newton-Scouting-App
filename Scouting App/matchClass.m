//
//  MatchClass.m
//  Scouting App
//
//  Created by jbertoncin on 2/10/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import "MatchClass.h"

@implementation MatchClass

- (void) initWithPyramidGoalM:(NSInteger *)pyramidgoal highGoalM:(NSInteger *)highgoal midGoalM:(NSInteger *)midgoal lowGoalM:(NSInteger *)lowgoal totalScoreM:(NSInteger *)totalscore threePointPenaltyTallyM:(NSInteger *)threepointpenaltytally thirtyPointPenaltyTallyM:(NSInteger *)thirtypointpenaltytally pyramidMissM:(NSInteger *)pyramidmiss highMissM:(NSInteger *)highmiss midMissM:(NSInteger *)midmiss lowMissM:(NSInteger *)lowmiss
{
        _pyramidGoalM = *pyramidgoal;
        _highGoalM = *highgoal;
        _midGoalM = *midgoal;
        _lowGoalM = *lowgoal;
        _totalScoreM = *totalscore;
        _threePointPenaltyTalllyM = *threepointpenaltytally;
        _thirtyPointPenaltyTallyM = *thirtypointpenaltytally;
        _pyramidGoalM = *pyramidmiss;
        _highMissM = *highmiss;
        _midMissM = *midmiss;
        _lowMissM = *lowmiss;
}

@end
