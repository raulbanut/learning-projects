//
//  EmojiMemoryGameView.swift
//  MemorizeGame
//
//  Created by Raul Banut on 29.03.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gameVM: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                ForEach(gameVM.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            gameVM.choose(card)
                        }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
            
            //            HStack(spacing: 0) {
            //                GenericButton {
            //                    if emojiCount < vehicles.count - 1 {
            //                        emojiCount += 1
            //                    }
            //                } label: {
            //                    Image(systemName: "plus.circle")
            //                }
            //
            //            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        EmojiMemoryGameView(gameVM: game)
    }
}
