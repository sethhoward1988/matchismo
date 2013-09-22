//
//  PlayingCard.h
//  Matchismo
//
//  Created by Seth Howard on 9/17/13.
//  Copyright (c) 2013 Seth Howard. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;

@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
