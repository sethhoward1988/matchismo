//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Seth Howard on 9/22/13.
//  Copyright (c) 2013 Seth Howard. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) NSMutableArray *currentCards;
@property (nonatomic) int score;
@property (nonatomic) NSString *action;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (NSMutableArray *)currentCards
{
    if (!_currentCards) _currentCards = [[NSMutableArray alloc] init];
    return _currentCards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }

    return self;
    
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4
#define THREE_MATCH_BONUS 5

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isUnplayable && !card.faceUp) {
        [self.currentCards addObject: card];
        card.faceUp = YES;
        if([self.currentCards count] == self.matchCount){
            Card *first = [self.currentCards objectAtIndex:0];
            Card *second = [self.currentCards objectAtIndex:1];
            int matchScore = 0;
            if(self.matchCount == 2){
                NSLog(@"Match count 2");
                matchScore = [first match:@[second]];
                if(matchScore){
                    first.unplayable = YES;
                    second.unplayable = YES;
                    self.score += matchScore * MATCH_BONUS;
                    self.action = [NSString stringWithFormat:@"Matched %@ and %@ for %d points",first.contents, second.contents, matchScore * THREE_MATCH_BONUS];
                } else {
                    self.score -= MISMATCH_PENALTY;
                    self.action = [NSString stringWithFormat:@"Flipped %@ and %@; %d point penalty",first.contents, second.contents, MISMATCH_PENALTY];
                    first.faceUp = NO;
                }
                [self.currentCards removeAllObjects];
                [self.currentCards addObject:second];
            } else if (self.matchCount == 3){
                NSLog(@"Match count 3");
                Card *third = [self.currentCards objectAtIndex:2];
                matchScore = [first match:@[second, third]];
                if(matchScore){
                    first.unplayable = YES;
                    second.unplayable = YES;
                    third.unplayable = YES;
                    self.score += matchScore * THREE_MATCH_BONUS;
                    self.action = [NSString stringWithFormat:@"Matched %@, %@, and %@ for %d points",first.contents, second.contents, third.contents, matchScore * THREE_MATCH_BONUS];
                } else {
                    self.score -= MISMATCH_PENALTY;
                    self.action = [NSString stringWithFormat:@"Flipped %@, %@, and %@; %d point penalty",first.contents, second.contents, third.contents, MISMATCH_PENALTY];
                    first.faceUp = NO;
                    second.faceUp = NO;
                }
                [self.currentCards removeAllObjects];
                [self.currentCards addObject:third];
            }
        
        }
        self.score -= FLIP_COST;
    }
}

@end
