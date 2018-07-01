//
//  Rank.swift
//  PlayingCardDemo
//
//  Created by Alexey Danilov on 27.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation

enum Rank: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .ace: return "A"
        case .numeric(let pips): return String(pips)
        case .face(let kind): return kind
        }
    }
    
    case ace
    case face(String)
    case numeric(Int)
    
    var order: Int {
        switch self {
        case .ace: return 1
        case .numeric(let pips): return pips
        case .face(let kind) where kind == "J": return 11
        case .face(let kind) where kind == "Q": return 12
        case .face(let kind) where kind == "K": return 13
        default: return 0
        }
    }
    
    static var all: [Rank] {
        var allRanks = [Rank.ace]
        for pips in 2...10 {
            allRanks.append(Rank.numeric(pips))
        }
        allRanks += [
            Rank.face("J"),
            .face("Q"),
            .face("K")
        ]
        return allRanks
    }
}
