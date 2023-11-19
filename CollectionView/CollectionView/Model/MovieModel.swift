//
//  MovieModel.swift
//  CollectionView
//
//  Created by Davit Natenadze on 03.11.23.
//

import UIKit


// MARK: - Model
struct MovieModel: Decodable {
    let title: String
    let year: String
    let runtime: String
    let genre: String
    let director: String
    let actors: String
    let plot: String
    let poster: String
    let imdbRating: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case imdbRating
    }
}


