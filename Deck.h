//
//  Deck.h
//  Matchismo
//
//  Created by Seth Howard on 9/17/13.
//  Copyright (c) 2013 Seth Howard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL) atTop;

- (Card *)drawRandomCard;

@end
