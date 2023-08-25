//
//  Item.swift
//  LootLogger
//
//  Created by Banut Raul on 17.07.2023.
//

import Foundation
import UIKit

class Item: Equatable, Codable {
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: Date
    var isFavorite: Bool
    
    init(name: String, valueInDollars: Int, serialNumber: String? = nil, dateCreated: Date, isFavorite: Bool = false) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = dateCreated
        self.isFavorite = isFavorite
    }
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny", "Sesquipedalian"]
            let nouns = ["Bear", "Spork", "Mac", "MacBook Pro with Psychic Transference"]
            
            let randomAdjective = adjectives.randomElement()!
            let randomNoun = nouns.randomElement()!
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int.random(in: 0..<100)
            let randomSerialNumber =
            UUID().uuidString.components(separatedBy: "-").first!
            
            
            
            self.init(name: randomName,
                      valueInDollars: randomValue,
                      serialNumber: randomSerialNumber,
                      dateCreated: Date.now)
        } else {
            self.init(
                name: "",
                valueInDollars: 0,
                serialNumber: nil,
                dateCreated: Date.now)
        }
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
        && lhs.dateCreated == rhs.dateCreated
        && lhs.serialNumber == rhs.serialNumber
        && lhs.valueInDollars == rhs.valueInDollars
    }
}
