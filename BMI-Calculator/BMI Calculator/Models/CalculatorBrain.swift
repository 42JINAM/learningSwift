//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by jinam on 4/23/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func    calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        var color: UIColor
        var advice: String
        
        if (bmiValue < 18.5) {
            color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            advice = "Eat more pies!"
        } else if (bmiValue < 24.9) {
            color = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            advice = "Fit as a fidle!"
        } else {
            color = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            advice = "Eat less pies!"
        }
        
        bmi = BMI(value: bmiValue, advice: advice, color: color)
    }
    
    func    getBMIValue() -> String {
        return (String(format: "%.1f", bmi?.value ?? 0.0))
    }
    func    getAdvice() -> String {
        return (bmi?.advice ?? "NO ADVICE!")!
    }
    func    getColor() -> UIColor {
        return (bmi?.color ?? UIColor.white)!
    }
    
}
