//
//  Store.swift
//  MovieLix
//
//  Created by Banut Raul on 25.07.2023.
//

import Foundation

class Store {
    
    var comedyList = [Movie]()
    var romanceList = [Movie]()
    var dramaList = [Movie]()
    var actionList = [Movie]()
    
    func createItems() {
        for _ in 1...15 {
            let newItem = Movie(
                title: AssetName.allCases.randomElement()!.rawValue,
                type: MovieType.allCases.randomElement()!,
                imageName: AssetName.allCases.randomElement()!.rawValue)
            
            switch newItem.type {
            case .comedy:
                comedyList.append(newItem)
            case .romance:
                romanceList.append(newItem)
            case .action:
                actionList.append(newItem)
            case .drama:
                dramaList.append(newItem)
            }
            
            print(newItem.description)
        }
    }
}

enum MovieType: Int, CaseIterable {
    
    case comedy, romance, action, drama
    
    var title: String {
        switch self {
        case .comedy:
            return "Comedy"
        case .romance:
            return "Romance"
        case .action:
            return "Action"
        case .drama:
            return "Drama"
        }
    }
}

class Movie {
    var title: String
    var type: MovieType
    var imageName: String
    
    init(title: String, type: MovieType, imageName: String) {
        self.title = title
        self.type = type
        self.imageName = imageName
    }
    
    var description: String {
        return "- title: \(title), type: \(type), imageName: \(imageName)"
    }
}
