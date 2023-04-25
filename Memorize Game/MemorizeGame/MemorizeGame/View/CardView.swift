//
//  CardView.swift
//  MemorizeGame
//
//  Created by Raul Banut on 29.03.2023.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let roundedShape = RoundedRectangle(cornerRadius: 20)
            if card.isFacedUp {
                roundedShape.fill().foregroundColor(.white)
                roundedShape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                roundedShape.opacity(0)
            } else {
                roundedShape.fill()
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CardView(card: MemoryGame<String>.Card.init(content: "🚗", id: 1))
            CardView(card: MemoryGame<String>.Card.init(content: "🚌", id: 1))
        }
    }
}
