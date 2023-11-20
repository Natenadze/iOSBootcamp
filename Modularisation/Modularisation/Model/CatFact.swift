//
//  CatFact.swift
//  Modularisation
//
//  Created by Davit Natenadze on 19.11.23.
//

import Foundation

struct CatFacts: Decodable {
    let data: [Fact]
}

struct Fact: Decodable {
    let fact: String
}
