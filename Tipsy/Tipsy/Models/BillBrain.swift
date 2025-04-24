//
//  BillBrain.swift
//  Tipsy
//
//  Created by jinam on 4/24/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct BillBrain {
    var totalBill: Double
    var people: Double
    var tipRate: Double
    var billPerPerson: Double
    
    mutating func    calculateBill() -> String{
        self.billPerPerson = (totalBill + totalBill * tipRate) / people
        return (String(self.billPerPerson))
    }
    func    getSentence() -> String {
        let rate = String(format: "%.0f", tipRate * 100)
        let people = String(format: "%.0f", self.people)
        return ("Split between \(people) people, with \(rate)% tip")
    }
}
