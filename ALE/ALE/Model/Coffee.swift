//
//  Coffee.swift
//  ALE
//
//  Created by Davit Natenadze on 25.10.23.
//

import Foundation

enum CoffeeSize: String {
    case small = "S"
    case medium = "M"
    case large = "L"
}

// MARK: - Model

struct Coffee {
    
    let title: String
    let subTitle: String
    let description: String
    let rating: Double
    let ratingQuantity: Int
    let size: CoffeeSize
    let price: Double
}


// MARK: - extension

extension Coffee {
    
    static let initial = Coffee(
        title: "Lambada",
        subTitle: "with Uranus",
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        rating: 3.1,
        ratingQuantity: 937,
        size: .medium,
        price: 2.55)
}
