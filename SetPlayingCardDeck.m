//
//  SetPlayingCardDeck.m
//  MatchismoTabbed
//
//  Created by Seth Howard on 10/1/13.
//  Copyright (c) 2013 Seth Howard. All rights reserved.
//

#import "SetPlayingCardDeck.h"
#import "SetPlayingCard.h"

@implementation SetPlayingCardDeck

- (id)init
{
    self = [super init];
    if (self) {
        for (NSString *color in [SetPlayingCard validColors]){
            for (NSString *suit in [SetPlayingCard validSuits]) {
                for (NSString *shade in [SetPlayingCard validShadings]){
                    for (NSString *num in [SetPlayingCard validNumbers]) {
                        SetPlayingCard *card = [[SetPlayingCard alloc] init];
                        card.number = num;
                        card.shade = shade;
                        card.suit = suit;
                        card.color = color;
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    return self;
}

@end

