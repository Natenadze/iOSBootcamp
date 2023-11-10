//
//  ApiManager.swift
//  CollectionView
//
//  Created by Davit Natenadze on 10.11.23.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
    case noData
    case decodeError
    case wrongResponse
    case wrongStatusCode(code: Int)
}

final class ApiManager {
    
    
    static func performURLRequest<T: Decodable>(_ urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(NetworkError.invalidURL))
                return
            }
            
            guard let data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(NetworkError.decodeError))
            }
            
        }.resume()
    }
    
    
    
}
