//
//  MovieControllerViewModel.swift
//  CollectionView
//
//  Created by Davit Natenadze on 17.11.23.
//

import Foundation

class MovieControllerViewModel {
    
    var movies = [MovieModel]()
    
    
    init() {
        Task { try await makeApiCall() }
    }
    
    // MARK: - Methods
    func makeApiCall() async throws {
        let urlStrings = MovieModel.initialUrls
        
        for url in urlStrings {
            
            if let movie: MovieModel = try? await NetworkManager.performURLRequest(url) {
                movies.append(movie)
            }else {
                throw NetworkError.badResponse
            }
            
        }
        
    }
    
}
