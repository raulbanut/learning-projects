//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by Raul Banut on 05.04.2023.
//

import Foundation
import SwiftUI

/// ViewModel
class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    static let vehicles = ["🚗","🏎","🚙","🚜","🛻","🚛","🚚","🚒"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.vehicles[pairIndex]
        }
    }
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
