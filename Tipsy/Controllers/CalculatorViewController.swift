//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipsyBrain = TipsyBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
//    var percent = 0.1
//    var persons = 2
//    var totalPerPerson = ""
    
    
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
        tipsyBrain.setPercent(currentTitle: sender.currentTitle!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        tipsyBrain.setPersons(count: sender.value)
        splitNumberLabel.text = String(tipsyBrain.returnPersons())
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        tipsyBrain.setTotalPerPerson(billTotal: billTextField.text ?? "")
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalPerPerson = tipsyBrain.returnTotalPerPerson()
            destinationVC.persons = tipsyBrain.returnPersons()
            destinationVC.percent = tipsyBrain.returnPercent()
        }
    }
}



