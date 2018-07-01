//
//  PlayingCard.swift
//  PlayingCardDemo
//
//  Created by Alexey Danilov on 27.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    
    var description: String {
        return "\(rank)\(suit)"
    }
    
    var suit: Suit
    
    var rank: Rank
    
    
}
