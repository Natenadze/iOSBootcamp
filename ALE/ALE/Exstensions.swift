//
//  Exstensions.swift
//  ALE
//
//  Created by Davit Natenadze on 25.10.23.
//

import UIKit

extension UIButton {
    
    func createIconButton(systemImageName: String) {
        setImage(UIImage(systemName: systemImageName), for: .normal)
        backgroundColor = .systemGray5
        tintColor = .orange
        layer.cornerRadius = 8
    }
    
    func createSizeButton(buttonName: String) {
        setTitle(buttonName, for: .normal)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray2.cgColor
    }
}


