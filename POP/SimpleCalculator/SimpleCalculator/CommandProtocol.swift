//
//  CommandProtocol.swift
//  SimpleCalculator
//
//  Created by Alexey Danilov on 26.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

protocol CommandProtocol {
    func execute(firstValue: Double, secondValue: Double) -> Double
}

struct AddCommand: CommandProtocol {
    func execute(firstValue: Double, secondValue: Double) -> Double {
        return firstValue + secondValue
    }
}

struct SubCommand: CommandProtocol {
    func execute(firstValue: Double, secondValue: Double) -> Double {
        return firstValue - secondValue
    }
}

struct MultiplyCommand: CommandProtocol {
    func execute(firstValue: Double, secondValue: Double) -> Double {
        return firstValue * secondValue
    }
}

struct DivideCommand: CommandProtocol {
    func execute(firstValue: Double, secondValue: Double) -> Double {
        return firstValue / secondValue
    }
}
