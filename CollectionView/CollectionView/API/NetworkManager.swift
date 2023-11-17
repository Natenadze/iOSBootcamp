//
//  NetworkManager.swift
//  CollectionView
//
//  Created by Davit Natenadze on 10.11.23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case badResponse
}

final class NetworkManager {
    
    static func performURLRequest<T: Decodable>(_ urlString: String) async throws -> T? {
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            throw NetworkError.noData
        }
    }
    
    
}

