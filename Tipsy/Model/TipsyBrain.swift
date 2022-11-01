//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Veronica Rudiuk on 1.11.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    
    var persons = 2
    var percent = 0.1
    var totalPerPerson = ""
    
    mutating func setPercent(currentTitle: String) {
        let buttonTitleMinusPercentSign = String(currentTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        percent = buttonTitleAsANumber / 100
    }
    
    mutating func setPersons(count: Double) {
        persons = Int(count)
    }
    
    mutating func setTotalPerPerson(billTotal: String) {
        let partOfBill = Double(billTotal)! * (1 + (percent)) / Double(persons)
        totalPerPerson = String(format: "%.2f", partOfBill)
    }
    
}
