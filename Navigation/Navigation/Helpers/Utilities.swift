//
//  Utilities.swift
//  Navigation
//
//  Created by Davit Natenadze on 27.10.23.
//

import UIKit


class Utilities {
    
    static func createSignInTextField(withPlaceholder placeholder: String) -> UITextField {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 9
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.autocorrectionType = .no
        textField.keyboardType = .asciiCapable
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.size.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        return textField
    }
}
