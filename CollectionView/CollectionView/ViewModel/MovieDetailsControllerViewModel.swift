//
//  MovieDetailsControllerViewModel.swift
//  CollectionView
//
//  Created by Davit Natenadze on 17.11.23.
//

import UIKit

final class MovieDetailsControllerViewModel {
    
    // MARK: - Properties
    private let movie: MovieModel
    private let image: UIImage?
    
    
    // MARK: - init
    init(movie: MovieModel, image: UIImage?) {
        self.movie = movie
        self.image = image
    }
    
    // MARK: - Methods
    func getMovie() -> MovieModel {
        movie
    } 
    
    func getImage() -> UIImage? {
        image
    }

     
}
