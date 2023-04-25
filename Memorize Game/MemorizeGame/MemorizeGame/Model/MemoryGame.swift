//
//  MemoryGame.swift
//  MemorizeGame
//
//  Created by Raul Banut on 05.04.2023.
//

import Foundation


/// Model
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFacedUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFacedUp = ($0 == newValue) } }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for cardIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(cardIndex)
            cards.append(Card(content: content, id: cardIndex * 2))
            cards.append(Card(content: content, id: cardIndex * 2 + 1))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFacedUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialIndex = indexOfTheFaceUpCard {
                if cards[chosenIndex].content == cards[potentialIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialIndex].isMatched = true
                }
                cards[chosenIndex].isFacedUp = true
            } else {
                indexOfTheFaceUpCard = chosenIndex
            }
            
        }
    }
    
    struct Card: Identifiable {
        var isFacedUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
