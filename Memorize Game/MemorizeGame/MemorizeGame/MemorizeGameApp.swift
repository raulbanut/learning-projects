//
//  MemorizeGameApp.swift
//  MemorizeGame
//
//  Created by Raul Banut on 29.03.2023.
//

import SwiftUI

@main
struct MemorizeGameApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(gameVM: game)
        }
    }
}
