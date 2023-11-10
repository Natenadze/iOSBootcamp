//
//  NetworkManager.swift
//  CollectionView
//
//  Created by Davit Natenadze on 10.11.23.
//

import Foundation


final class NetworkManager {    
   
    // isPoster პარამეტრის ჩამატება მომიწია რადგან, UIImage რო არ აკონფორმებს decodable ს, არ მიბრუნებდა დატას და catch ში შედიოდა)) 
    static func performURLRequest<T: Decodable>(_ urlString: String, isPoster: Bool) async throws -> T? {
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if isPoster { return data as? T }
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            throw NetworkError.noData
        }
    }
    
   
}

