//
//  CalculationVM.swift
//  GCD_LCM
//
//  Created by Davit Natenadze on 22.10.23.
//

import Foundation

class CalculationVM {
    
    
    func findGCD(_ num1: Int, _ num2: Int) -> Int {
        var x = num1
        var y = num2

        while y != 0 {
            let temp = y
            y = x % y
            x = temp
        }

        return x
    }
    
    func findLCM(_ a: Int, _ b: Int) -> Int {
        return (a * b) / findGCD(a, b)
    }
    
}
