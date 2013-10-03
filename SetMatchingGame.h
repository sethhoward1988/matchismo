//
//  SetMatchingGame.h
//  MatchismoTabbed
//
//  Created by Seth Howard on 10/1/13.
//  Copyright (c) 2013 Seth Howard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface SetMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;
@property (nonatomic, readwrite) int matchCount;
@property (nonatomic, readonly) NSString *action;

@end
