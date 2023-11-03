//
//  MovieModel.swift
//  CollectionView
//
//  Created by Davit Natenadze on 03.11.23.
//

import UIKit

// MARK: - enum
enum MovieGenre: String {
    case action = "Action"
    case crime = "Crime"
    case drama = "Drama"
    case comedy = "Comedy"
    case adventure = "Adventure"
    case horror = "Horror"
}


// MARK: - Model
struct MovieModel {
    
    let image: UIImage
    let title: String
    let imdbRating: Float
    let description: String
    let certificate: String
    let runtime: String
    let releaseDate: Int
    let genre: MovieGenre
    let director: String
    let cast: String
    var isFavorite: Bool = false
}


// MARK: - extension
extension MovieModel {
    
    static let initial = [
        MovieModel(
            image: UIImage(named: "movie1")!,
            title: "Movie 1",
            imdbRating: 8.5,
            description: "Description of Movie 1 Description of Movie 1Description of Movie 1Description of Movie 1Description of Movie 1Description of Movie 1Description of this is random message ",
            certificate: "PG-13",
            runtime: "2h 15m",
            releaseDate: 2022,
            genre: .action,
            director: "Director 1",
            cast: "Actor A, Actor B  of Movie 1 Description of Movie 1Description of Movie 1Description of Movie 1Description of Movie 1Description of Movie 1Descrip"),
        
        MovieModel(
            image: UIImage(named: "movie2")!,
            title: "Movie 2",
            imdbRating: 7.9,
            description: "Description of Movie 2",
            certificate: "R",
            runtime: "2h 5m",
            releaseDate: 2021,
            genre: .comedy,
            director: "Director 2",
            cast: "Actor C, Actor D"),
   
        MovieModel(
            image: UIImage(named: "movie3")!,
            title: "Movie 3",
            imdbRating: 7.0,
            description: "Description of Movie 3",
            certificate: "PG",
            runtime: "1h 45m",
            releaseDate: 1992,
            genre: .drama,
            director: "Director 3",
            cast: "Actor E, Actor F"),
        
        MovieModel(
            image: UIImage(named: "movie4")!,
            title: "Movie 4",
            imdbRating: 8.0,
            description: "Description of Movie 4",
            certificate: "PG-13",
            runtime: "2h 5m",
            releaseDate: 2020,
            genre: .crime,
            director: "Director 4",
            cast: "Actor G, Actor H"),
        
        MovieModel(
            image: UIImage(named: "movie5")!,
            title: "Movie 5",
            imdbRating: 9.2,
            description: "Description of Movie 5",
            certificate: "R",
            runtime: "2h 30m",
            releaseDate: 2019,
            genre: .action,
            director: "Director 5",
            cast: "Actor I, Actor J"),
        
        MovieModel(
            image: UIImage(named: "movie6")!,
            title: "Movie 6",
            imdbRating: 8.7,
            description: "Description of Movie 6",
            certificate: "PG",
            runtime: "2h 10m",
            releaseDate: 2021,
            genre: .comedy,
            director: "Director 6",
            cast: "Actor K, Actor L"),
        
        MovieModel(
            image: UIImage(named: "movie1")!,
            title: "Movie 7",
            imdbRating: 7.5,
            description: "Description of Movie 7",
            certificate: "R",
            runtime: "2h",
            releaseDate: 2020,
            genre: .action,
            director: "Director 7",
            cast: "Actor M, Actor N"),
        
        MovieModel(
            image: UIImage(named: "movie2")!,
            title: "Movie 8",
            imdbRating: 8.9,
            description: "Description of Movie 8",
            certificate: "PG-13",
            runtime: "2h 20m",
            releaseDate: 2018,
            genre: .drama,
            director: "Director 8",
            cast: "Actor O, Actor P"),
        
        MovieModel(
            image: UIImage(named: "movie5")!,
            title: "Movie 9",
            imdbRating: 7.8,
            description: "Description of Movie 9",
            certificate: "PG",
            runtime: "2h 5m",
            releaseDate: 2023,
            genre: .crime,
            director: "Director 9",
            cast: "Actor Q, Actor R"),
        
        MovieModel(
            image: UIImage(named: "movie6")!,
            title: "Movie 10",
            imdbRating: 8.3,
            description: "Description of Movie 10",
            certificate: "R",
            runtime: "2h 10m",
            releaseDate: 2022,
            genre: .action,
            director: "Director 10",
            cast: "Actor S, Actor T")
    ]
}


