//
//  AllMatches.m
//  Scouting App
//
//  Created by Eris on 2/2/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import "AllMatches.h"

@interface AllMatches()

@end

@implementation AllMatches

-(NSMutableArray *)matches{
    if(_matches == nil) _matches = [[NSMutableArray alloc] init];
    return _matches;
}
-(void)addMatch:(MatchClass *)newMatch
{
    [self.matches addObject:(MatchClass *) newMatch];
}
@end


