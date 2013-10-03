//
//  SetPlayingCard.h
//  Matchismo
//
//  Created by Seth Howard on 9/17/13.
//  Copyright (c) 2013 Seth Howard. All rights reserved.
//

#import "Card.h"

@interface SetPlayingCard : Card

@property (strong, nonatomic) NSString *suit;

@property (strong, nonatomic) NSString *number;

@property (strong, nonatomic) NSString *shade;

@property (strong, nonatomic) NSString *color;

+ (NSArray *)validSuits;
+ (NSArray *)validNumbers;
+ (NSArray *)validShadings;
+ (NSArray *)validColors;

@end