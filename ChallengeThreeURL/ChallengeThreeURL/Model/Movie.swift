//
//  Movie.swift
//  ChallengeThreeURL
//
//  Created by Banut Raul on 25.08.2023.
//

import Foundation

class Movie: Codable {
    let id: Int
    let title: String
    let imagePath: String
    let overview: String
    let voteAverage: Double
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "original_title"
        case imagePath = "poster_path"
        case overview
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        imagePath = try container.decode(String.self, forKey: .imagePath)
        overview = try container.decode(String.self, forKey: .overview)
        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
    }
}
