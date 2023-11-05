//
//  UIColor + extension.swift
//  DataPersistence
//
//  Created by Davit Natenadze on 05.11.23.
//

import UIKit


extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let appColor = UIColor.rgb(red: 19, green: 161, blue: 212)
}
