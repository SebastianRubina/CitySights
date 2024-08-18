//
//  DataService.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-17.
//

import Foundation

struct DataService {
    let apiKey = Bundle.main.infoDictionary?["YELP_API_KEY"] as? String
    
    func businessSearch() async -> [Business] {
        // Check if API KEY exist
        guard apiKey != nil else {
            return [Business]()
        }
        
        // 1. Create URL
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=43.778299744336394&longitude=-79.31238429763629&categories=restaurants&limit=10") {
            
            // 2. Create Request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            // 3. Create Session
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                
                // 4. Parse JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                return result.businesses
            } catch {
                print("ERROR: \(error)")
            }
        }
        
        return [Business]()
    }
}

