//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var percent = 0.1
    var persons = 2
    var onePersonShouldToPay = 0.00

    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        billTextField.endEditing(true)
        
//        My solution:
//        switch sender {
//        case zeroPctButton:
//            zeroPctButton.isSelected = true
//            precent = 0.0
//        case tenPctButton:
//            tenPctButton.isSelected = true
//            precent = 0.1
//        case twentyPctButton:
//            twentyPctButton.isSelected = true
//            precent = 0.2
//        default:
//            break
//        }
        
//        Angela solution:
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        percent = buttonTitleAsANumber / 100
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        persons = Int(sender.value)
        splitNumberLabel.text = String(persons)
    }
    @IBAction func calculatePressed(_ sender: Any) {
        let billTotal = billTextField.text ?? ""
        onePersonShouldToPay = Double(billTotal) ?? 0.0 * (1 + percent) / Double(persons)
        print(String(format: "%.2f", onePersonShouldToPay))
    }
    
}

