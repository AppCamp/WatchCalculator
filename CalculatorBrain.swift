//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Marta Wozniak on 18/07/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    var operand1: Double = 0
    var operand2: Double = 0
    var operation: String = "="
    
    func calculate() -> Double{
        var result: Double = 0
        switch operation{
        case "+": result = operand2 + operand1
        case "-": result = operand1 - operand2
        default: result = 0
        }
        
        operand1 = result
        
        return result
    }
    
}