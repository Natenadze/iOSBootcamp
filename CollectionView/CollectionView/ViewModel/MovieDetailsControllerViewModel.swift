//
//  MovieDetailsControllerViewModel.swift
//  CollectionView
//
//  Created by Davit Natenadze on 17.11.23.
//

import UIKit

class MovieDetailsControllerViewModel {
    
    // MARK: - Properties
    let movie: MovieModel
    let image: UIImage?
    
    
    // MARK: - init
    init(movie: MovieModel, image: UIImage?) {
        self.movie = movie
        self.image = image
    }
     
}
