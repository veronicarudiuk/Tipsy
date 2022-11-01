//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Veronica Rudiuk on 1.11.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    
    var tipsy: Tipsy?
    
    mutating func setPercent(currentTitle: String) {
        let buttonTitleMinusPercentSign = String(currentTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tipsy?.percent = buttonTitleAsANumber / 100
    }
    
    func returnPercent() -> Double {
        tipsy?.percent ?? 0.1
    }
    
    mutating func setPersons(count: Double) {
        tipsy?.persons = Int(count)
    }
    
    func returnPersons() -> Int {
        tipsy?.persons ?? 2
    }
    
    mutating func setTotalPerPerson(billTotal: String) {
        let partOfBill = Double(billTotal)! * (1 + (tipsy?.percent ?? 0.10)) / Double(tipsy?.persons ?? 2)
        tipsy?.totalPerPerson = String(format: "%.2f", partOfBill)
    }
    
    func returnTotalPerPerson() -> String {
        tipsy?.totalPerPerson ?? ""
    }
    
}
