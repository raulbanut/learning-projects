//
//  MemoryGame.swift
//  MemorizeGame
//
//  Created by Raul Banut on 05.04.2023.
//

import Foundation


/// Model
struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for cardIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(cardIndex)
            cards.append(Card(content: content, id: cardIndex * 2))
            cards.append(Card(content: content, id: cardIndex * 2 + 1))
        }
    }
    
    func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        var chosenCard = cards[chosenIndex]
        chosenCard.isFacedUp.toggle()
        
        print("choosen card \(chosenCard)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index 
            }
        }
        return 0
    }
    
    struct Card: Identifiable {
        var isFacedUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
