//
//  ViewController.swift
//  GCD
//
//  Created by Davit Natenadze on 08.11.23.
//


import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    private var isWinnerThread = false
    
    private var number1 = 0 {
        didSet {
            DispatchQueue.global().async { [weak self] in
                self?.calculateFactorialAndPrintWinnerThread(for: "number1", number: self?.number1 ?? 0)
            }
        }
    }
    
    private var number2 = 0 {
        didSet {
            DispatchQueue.global().async { [weak self] in
                self?.calculateFactorialAndPrintWinnerThread(for: "number2", number: self?.number2 ?? 0)
            }
        }
    }
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTwoRandomNumbers()
        
    }
    
    // MARK: - Methods
    private func generateTwoRandomNumbers() {
        number1 = Int.random(in: 20..<50)
        number2 = Int.random(in: 20..<50)
    }
    
    private func factorial(_ n: Int) -> NSDecimalNumber {
        if n <= 1 {
            return NSDecimalNumber(value: 1)
        }
        
        var result = NSDecimalNumber(value: 1)
        for i in 2...n {
            result = result.multiplying(by: NSDecimalNumber(value: i))
        }
        return result
    }
    
    
    private func calculateFactorialAndPrintWinnerThread(for thread: String, number: Int) {
        let result = factorial(number)
        printWinnerThread(thread: thread, number: result)
        
    }
    
    
    
    private func printWinnerThread(thread: String, number: NSDecimalNumber) {
        if !isWinnerThread {
            isWinnerThread = true
            print("Winner thread is: \(thread) thread, factorial: \(number)")
        }
    }
}






