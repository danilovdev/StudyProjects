//
//  Suit.swift
//  PlayingCardDemo
//
//  Created by Alexey Danilov on 27.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation

enum Suit: String, CustomStringConvertible {
    
    var description: String {
        return rawValue
    }
    
    case spades = "♠️"
    case hearts = "♥️"
    case diamonds = "♦️"
    case clubs = "♣️"
    
    static var all = [
        Suit.spades,
        .hearts,
        .diamonds,
        .clubs
    ]
}
