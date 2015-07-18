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
    
    var isUserInTheMiddleOfTypingNumber: Bool = false
    let calculatorBrain: CalculatorBrain = CalculatorBrain()
    
    var displayValue: Double {
        get {
            return (display.text! as NSString).doubleValue
        }
        set{
            display.text = "\(newValue)"
        }
    }
    
    @IBAction func appendDot() {
        if (display.text!.rangeOfString(".") == nil) {
            display.text = display.text! + "."
        }
    }
    
    
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
        
        if isUserInTheMiddleOfTypingNumber {
            isUserInTheMiddleOfTypingNumber = false
            calculatorBrain.operand1 = displayValue
        }
        
        calculatorBrain.operation = sender.currentTitle!
        display.text = sender.currentTitle!
    }
    
    @IBAction func calculate(sender: UIButton) {
        
        calculatorBrain.operand2 = displayValue
        displayValue = calculatorBrain.calculate()
        isUserInTheMiddleOfTypingNumber = false
        calculatorBrain.operation = "="
        
    }
}

