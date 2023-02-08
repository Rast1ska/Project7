//
//  NetworkManager.swift
//  Project7
//
//  Created by Ильфат Салахов on 07.02.2023.
//

import Foundation

enum FetchPetisionsResult {
    case success(petisions: [Petition])
    case failure(error: Error)
}

class NetworkManager {
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func fetchPetision(completion: @escaping (FetchPetisionsResult) -> Void) {
        
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        guard let url = URL(string: urlString) else { return }
        
        session.dataTask(with: url) { [weak self] data, response, error in
            
            var result: FetchPetisionsResult
            
            guard let strongSelf = self else {
                result = .failure(error: error!)
                return
                
            }
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            if error == nil, let data = data {
                guard let petitions = try? strongSelf.decoder.decode(Petitions.self, from: data) else {
                    result = .failure(error: error!)
                    return
                    
                }
                
                result = .success(petisions: petitions.results)
                
            } else {
                result = .failure(error: error!)
            }
        }.resume()
    }
}
