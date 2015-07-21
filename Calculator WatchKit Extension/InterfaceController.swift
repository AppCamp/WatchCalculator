//
//  InterfaceController.swift
//  Calculator WatchKit Extension
//
//  Created by Marta Wozniak on 20/07/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var display: WKInterfaceLabel!
    var displayText: String = " "
    var operation: String = " "
    var operand1: String = " "
    var isUserInTheMiddleOfTypingNumber = false
    
    
    func sendMessageToParentApp() {
        let infoDictionary = ["operand1" : operand1, "operand2" : displayText, "operation" : operation]
        
        WKInterfaceController.openParentApplication(infoDictionary) {
            (replyDictionary, error) -> Void in
            
            if let castedResponseDictionary = replyDictionary as? [String: Double],
                responseMessage = castedResponseDictionary["result"]
            {
                self.display.setText("\(responseMessage)")
            }
        }
    }
    
    func appendDigit(digit: String){
        if isUserInTheMiddleOfTypingNumber {
            displayText += digit
        }
        else {
            displayText = digit
            isUserInTheMiddleOfTypingNumber = true
        }
        display.setText(displayText)
    }
    
    func selectOperation(op: String){
        operation = op
        isUserInTheMiddleOfTypingNumber = false
        operand1 = displayText
        displayText = operation
        display.setText(displayText)
    }
    
    
    @IBAction func pushSeven() {
        appendDigit("7")
    }
    
    @IBAction func pushEight() {
        appendDigit("8")
    }

    @IBAction func pushNine() {
        appendDigit("9")
    }
    
    @IBAction func pushAdd() {
        selectOperation("+")
    }
    
    @IBAction func pushMinus() {
        selectOperation("-")
    }
    
    @IBAction func pushEquals() {
        sendMessageToParentApp()
        isUserInTheMiddleOfTypingNumber = false
    }
}
