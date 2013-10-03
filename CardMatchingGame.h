//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Seth Howard on 9/22/13.
//  Copyright (c) 2013 Seth Howard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;
@property (nonatomic, readwrite) int matchCount;
@property (nonatomic, readonly) NSString *action;

@end
