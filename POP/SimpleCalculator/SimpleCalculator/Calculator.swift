//
//  Calculator.swift
//  SimpleCalculator
//
//  Created by Alexey Danilov on 26.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

struct Calculator {
    
    var currentValue = 0.0
    
    var lastCommand: CommandProtocol?
    
    mutating func clear() {
        currentValue = 0.0
    }
    
    mutating func commandEntered(newNumber: Double, nextCommand: CommandProtocol?) {
        if let lastCommand = self.lastCommand {
            self.currentValue = lastCommand.execute(firstValue: currentValue, secondValue: newNumber)
        } else {
            self.currentValue = newNumber
        }
        lastCommand = nextCommand
    }
}
