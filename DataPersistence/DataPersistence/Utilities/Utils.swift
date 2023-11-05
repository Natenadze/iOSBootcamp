//
//  Utils.swift
//  DataPersistence
//
//  Created by Davit Natenadze on 05.11.23.
//

import UIKit


class Utilities {
    
    
    func textField(withPlaceholder placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.autocorrectionType = .no
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])
        return tf
    }
    
    
}

