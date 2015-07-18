//
//  ViewController.swift
//  Calculator
//
//  Created by Marta Wozniak on 18/07/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var firstDigit: Bool = true
    var operand1: Double = 0
    var operation: String = "="
    
    var displayValue: Double {
        get {
            return (display.text! as NSString).doubleValue
        }
        
        set{
            display.text = "\(newValue)"
        }
    }
    
    var isUserInTheMiddleOfTypingNumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isUserInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            isUserInTheMiddleOfTypingNumber = true
        }
    }

    @IBAction func performOperation(sender: UIButton) {
        firstDigit = false
        isUserInTheMiddleOfTypingNumber = false
        operation = sender.currentTitle!
        operand1 = displayValue
    }
    
    @IBAction func calculate(sender: UIButton) {
        switch operation{
            case "+": displayValue = displayValue + operand1
            case "-": displayValue = operand1 - displayValue
            default: displayValue = 0
        }
        
        isUserInTheMiddleOfTypingNumber = false
        
    }
}

