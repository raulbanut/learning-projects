//
//  MoviesResponse.swift
//  ChallengeThreeURL
//
//  Created by Banut Raul on 25.08.2023.
//

import Foundation

class MoviesResponse: Decodable {
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        results = try container.decode([Movie].self, forKey: .results)
    }
}
