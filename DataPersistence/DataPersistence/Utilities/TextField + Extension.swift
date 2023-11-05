//
//  TextField + Extension.swift
//  DataPersistence
//
//  Created by Davit Natenadze on 05.11.23.
//

import UIKit


extension UITextField {
    
    static func textField(withPlaceholder placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.backgroundColor = .systemBackground
        tf.placeholder = placeholder
        tf.font = .systemFont(ofSize: 16)
        tf.layer.cornerRadius = 8
        tf.autocorrectionType = .no
        tf.heightAnchor.constraint(equalToConstant: 42).isActive = true
        return tf
    }
}
