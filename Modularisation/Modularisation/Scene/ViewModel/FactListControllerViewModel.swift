//
//  FactListControllerViewModel.swift
//  Modularisation
//
//  Created by Davit Natenadze on 19.11.23.
//


import Foundation
import NatenWorking


protocol FactListControllerDelegate: AnyObject {
    func networkingDone()
}


final class FactListControllerViewModel {
    
    // MARK: - Properties
    private var catFacts = [Fact]()
    weak var delegate: FactListControllerDelegate?
    
    
    // MARK: - Methods
    func viewDidLoad() {
        Task { try await makeApiCall() }
    }
    
    func getCatFact(_ index: Int) -> String {
        catFacts[index].fact
    }
    
    func getCatFactsCount() -> Int {
        catFacts.count
    }
    
    private func makeApiCall() async throws {
        
        let url = Constants.catFactsUrl
        
        if let facts: CatFacts = try? await NetworkManager().performURLRequest(url) {
            self.catFacts = facts.data
                self.delegate?.networkingDone()
        }else {
            throw NetworkError.noData
        }
    }
}
