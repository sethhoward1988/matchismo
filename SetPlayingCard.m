//
//  SetPlayingCard.m
//  Matchismo
//
//  Created by Martin Mandl on 25.01.13.
//  Copyright (c) 2013 m2m server software gmbh. All rights reserved.
//

#import "SetPlayingCard.h"

@implementation SetPlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
//    if (otherCards.count == 1) {
//        SetPlayingCard *otherCard = [otherCards lastObject];
//        if ([otherCard.suit isEqualToString:self.suit]) {
//            score = 1;
//        } else if (otherCard.rank == self.rank) {
//            score = 4;
//        }
//    }
    
    return score;
}

- (NSMutableDictionary *)contents
{
    
    NSMutableDictionary *content = [NSMutableDictionary dictionary];
    [content setObject:[@"" stringByPaddingToLength:[self.number intValue] withString: self.suit startingAtIndex:0] forKey:@"display"];
    [content setObject:self.color forKey:@"color"];
    [content setObject:self.suit forKey:@"suit"];
    [content setObject:self.number forKey:@"number"];
    return content;
}

@synthesize suit = _suit; // because we provide setter && getter

- (void)setSuit:(NSString *)suit
{
    if ([[SetPlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)validSuits
{
    return @[@"▴", @"●", @"▪"];
}

+ (NSArray *)validNumbers
{
    return @[@"1",@"2",@"3"];
}

+ (NSArray *)validShadings
{
    return @[@"solid",@"striped", @"open"];
}

+ (NSArray *)validColors
{
    return @[@"red",@"green", @"blue"];
}


@end