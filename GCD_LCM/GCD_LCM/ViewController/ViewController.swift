//
//  ViewController.swift
//  GCD_LCM
//
//  Created by Davit Natenadze on 22.10.23.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var method: UILabel!
    @IBOutlet weak var number1TextField: UITextField!
    @IBOutlet weak var number2TextField: UITextField!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    // MARK: -
    let calculationVM = CalculationVM()
    
    var num1: Int {
        Int(number1TextField.text!) ?? 0
    }
    
    var num2: Int {
        Int(number2TextField.text!) ?? 0
    }
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    
    // MARK: - @IBActions
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        method.text = sender.isOn ? "უსგ" : "უსჯ"
    }
    
    @IBAction func calculateButtonPressed() {
        updateAnswerLabel()
    }
    
}


extension ViewController {
    
    private func setupVC() {
        number1TextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        number2TextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    
    @objc func textFieldDidChange() {
        let isAnyTextFieldEmpty = number1TextField.text?.isEmpty ?? true || number2TextField.text?.isEmpty ?? true
        
        calculateButton.isEnabled = !isAnyTextFieldEmpty
    }
    
    //
    private func updateAnswerLabel() {
        if method.text == "უსგ" {
            let gcd = calculationVM.findGCD(num1, num2)
            answer.text = String(gcd)
        } else {
            let lcm = calculationVM.findLCM(num1, num2)
            answer.text = String(lcm)
        }
    }
}
