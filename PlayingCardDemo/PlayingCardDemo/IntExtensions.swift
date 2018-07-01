//
//  IntExtensions.swift
//  PlayingCardDemo
//
//  Created by Alexey Danilov on 27.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation

extension Int {
    
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
