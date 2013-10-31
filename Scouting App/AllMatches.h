//
//  AllMatches.h
//  Scouting App
//
//  Created by Eris on 2/2/13.
//  Copyright (c) 2013 Louie Bertoncin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MatchClass.h"

@interface AllMatches : NSObject
@property (nonatomic, strong) NSMutableArray *matches;

-(void)addMatch:(MatchClass *)newMatch;

@end
