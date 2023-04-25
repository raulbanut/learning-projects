//
//  CardView.swift
//  MemorizeGame
//
//  Created by Raul Banut on 29.03.2023.
//

import SwiftUI

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                let roundedShape = RoundedRectangle(cornerRadius: 20)
                if card.isFacedUp {
                    roundedShape.fill().foregroundColor(.white)
                    roundedShape.strokeBorder(lineWidth: 3)
                    Text(card.content)
                        .font(font(size: proxy.size))
                } else if card.isMatched {
                    roundedShape.opacity(0)
                } else {
                    roundedShape.fill()
                }
            }
        }
    }
    
    private func font(size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * 0.8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CardView(card: EmojiMemoryGame.Card.init(content: "🚗", id: 1))
            CardView(card: EmojiMemoryGame.Card.init(content: "🚌", id: 1))
        }
    }
}
