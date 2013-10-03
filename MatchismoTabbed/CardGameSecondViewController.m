//
//  CardGameSecondViewController.m
//  MatchismoTabbed
//
//  Created by Seth Howard on 10/1/13.
//  Copyright (c) 2013 Seth Howard. All rights reserved.
//

#import "CardGameSecondViewController.h"
#import "SetPlayingCardDeck.h"
#import "SetMatchingGame.h"

@interface CardGameSecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) SetMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@property (strong, nonatomic) NSMutableArray *cards;
@property (weak, nonatomic) IBOutlet UIButton *dealButton;

@end

@implementation CardGameSecondViewController

- (SetMatchingGame *)game
{
    if (!_game) {
        _game = [[SetMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[SetPlayingCardDeck alloc] init]];
    }
    return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [self setCard:card forButton: cardButton];
    }
}

- (IBAction)reDeal:(id)sender {
    int existingMatchCount = self.game.matchCount;
    self.game = [[SetMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[SetPlayingCardDeck alloc] init]];
    self.game.matchCount = existingMatchCount;
    [self updateUI];
    [self setFlipCount:0];
    self.actionLabel.text = @"New Game Dealt";
}

- (void)updateUI
{
    _cards = [[NSMutableArray alloc] init];
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        cardButton.selected = card.isFaceUp;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.actionLabel.text = self.game.action;
}

- (void)setCard:(Card*) card forButton:(UIButton*) cardButton
{
    NSMutableDictionary *contents = (NSMutableDictionary *)card.contents;
    cardButton.enabled = YES;
    NSString *color = [contents objectForKey:@"color"];
    [cardButton setTitle:[contents objectForKey:@"display"] forState:UIControlStateNormal];
    [cardButton setBackgroundColor:[UIColor blackColor]];
    if([color isEqual: @"red"]){
        [cardButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cardButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [cardButton setBackgroundColor:[UIColor redColor]];
    } else if ([color isEqual: @"blue"]){
        [cardButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [cardButton setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        [cardButton setBackgroundColor:[UIColor blueColor]];
    } else {
        [cardButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [cardButton setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        [cardButton setBackgroundColor:[UIColor greenColor]];
    }
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}


@end
