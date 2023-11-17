//
//  MovieModel.swift
//  CollectionView
//
//  Created by Davit Natenadze on 03.11.23.
//

import UIKit

let apiKey = "33c3587a"


// MARK: - Model
struct MovieModel: Codable {
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



// MARK: - extension
extension MovieModel {
    
    static let initialUrls = [
        "https://www.omdbapi.com/?t=Titanic&apikey=\(apiKey)",
        "https://www.omdbapi.com/?t=The%20Big%20Bang%20Theory&apikey=\(apiKey)",
        "https://www.omdbapi.com/?t=How%20to%20Train%20Your%20Dragon&apikey=\(apiKey)",
        "https://www.omdbapi.com/?t=The%20Girl%20with%20the%20Dragon%20Tattoo&apikey=\(apiKey)",
        "https://www.omdbapi.com/?t=Bean&apikey=\(apiKey)",
        "https://www.omdbapi.com/?t=Dictator&apikey=\(apiKey)"
    ]
}


