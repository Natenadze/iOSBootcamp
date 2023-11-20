//
//  MovieControllerViewModel.swift
//  CollectionView
//
//  Created by Davit Natenadze on 17.11.23.
//

import Foundation

protocol MovieControllerDelegate: AnyObject {
    func handleDidSelectCollectionCell(movie: MovieModel)
    func networkingDone()
}

final class MovieControllerViewModel {
    
    // MARK: - Properties
    private var movies = [MovieModel]()
    weak var delegate: MovieControllerDelegate?
    
    // MARK: - Methods
    func viewDidLoad() {
        Task { try await makeApiCall() }
        
    }
    
    func getMovie(_ index: Int) -> MovieModel {
        movies[index]
    }
    
    func movieCount() -> Int {
        movies.count
    }    
    
    func didSelectCollectionCell(at indexPath: IndexPath) {
        delegate?.handleDidSelectCollectionCell(movie: movies[indexPath.row])
    }
    
    
    
    private func makeApiCall() async throws {
        let urlStrings = Constants.initialUrls
        
        for url in urlStrings {
            if let movie: MovieModel = try? await NetworkManager.performURLRequest(url) {
                movies.append(movie)
                DispatchQueue.main.async {
                    self.delegate?.networkingDone()
                }
            }else {
                throw NetworkError.badResponse
            }
        }
    }
    
}
