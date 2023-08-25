//
//  API.swift
//  ChallengeThreeURL
//
//  Created by Banut Raul on 24.08.2023.
//

import Foundation
import UIKit

struct API {
    
    static let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NTQ0YjBlOWFhYzRlNTMyZGY5OGMyMTk4NWQ1ZmJmNCIsInN1YiI6IjY0YTJiYmQ1ZThkMDI4MDBjNTQ2N2M0NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iApxWvYpCbjYWS27ZXKdDxgXtNqRMnG8LxSWwqMWsDY"
    static let apiKey = "8544b0e9aac4e532df98c21985d5fbf4"
    static let accountId = "20339940"
}

extension API {
    
    // MARK: - Get
    static func getNowPlaying() async throws -> [Movie] {
        let baseURL = "https://api.themoviedb.org/3/movie/now_playing"
        let apiKey = apiKey
        
        var components = URLComponents(string: baseURL)!
        components.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        
        let url = components.url!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(MoviesResponse.self, from: data)
        
        return decoded.results
    }
    
    static func getImage(posterPath: String) async throws -> UIImage? {
        let baseURL = "https://image.tmdb.org/t/p/w500/\(posterPath)"
        
        var components = URLComponents(string: baseURL)!
        components.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        
        let url = components.url!
        let data = try Data(contentsOf: url)
        
        return UIImage(data: data)
    }
}

extension API {
    
    // MARK: - Post
    static func postFavorite(movieId: Int) async throws {
        let baseURL = "https://api.themoviedb.org/3/account/\(accountId)/favorite"
        
        let headers = [
            "accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
        
        let parameters = [
            "media_type": "movie",
            "media_id": movieId,
            "favorite": true
        ] as [String : Any]
        
        let postData = try JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                dump(httpResponse?.statusCode)
            }
        })
        dataTask.resume()
    }
}
