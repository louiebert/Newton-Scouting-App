//
//  MatchClass.h
//  Scouting App
//
//  Created by jbertoncin on 2/10/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MatchClass : NSObject

@property (nonatomic) int pyramidGoalM;
@property (nonatomic) int highGoalM;
@property (nonatomic) int midGoalM;
@property (nonatomic) int lowGoalM;
@property (nonatomic) int totalScoreM;
@property (nonatomic) int threePointPenaltyTalllyM;
@property (nonatomic) int thirtyPointPenaltyTallyM;
@property (nonatomic) int pyramidMissM;
@property (nonatomic) int highMissM;
@property (nonatomic) int midMissM;
@property (nonatomic) int lowMissM;

- (void)initWithPyramidGoalM:(NSInteger *)pyramidgoal
                   highGoalM:(NSInteger *)highgoal
                    midGoalM:(NSInteger *)midgoal
                    lowGoalM:(NSInteger *)lowgoal
                 totalScoreM:(NSInteger *)totalscore
     threePointPenaltyTallyM:(NSInteger *)threepointpenaltytally
    thirtyPointPenaltyTallyM:(NSInteger *)thirtypointpenaltytally
                pyramidMissM:(NSInteger *)pyramidmiss
                   highMissM:(NSInteger *)highmiss
                    midMissM:(NSInteger *)midmiss
                    lowMissM:(NSInteger *)lowmiss;

@end
