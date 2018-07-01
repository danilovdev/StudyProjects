//
//  PlayingCardDeck.swift
//  PlayingCardDemo
//
//  Created by Alexey Danilov on 27.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in Suit.all {
            for rank in Rank.all {
                let playingCard = PlayingCard(suit: suit, rank: rank)
                cards.append(playingCard)
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}
