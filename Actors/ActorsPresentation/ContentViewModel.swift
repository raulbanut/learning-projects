//
//  ContentViewModel.swift
//  ActorsPresentation
//
//  Created by Raul Banut on 21.09.2022.
//

import Foundation

class ContentViewModel: ObservableObject {
    var game = Game() /// For Actors
//    var gameClass = GameClass() /// For Class
    
    @MainActor
    @Published var points: Int = 0
    
    @Published var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @Published var moneyGeneratorsEnabled = true
    
    func getMoney() {
        Task {
            let points = await game.currentPoints /// For Actors
            
//            let points = gameClass.currentPoints /// For Class
            
            await MainActor.run {
                self.points = points
            }
        }
    }
    
    func addMoneyButton() {
        Task {
            await game.addPoints(source: "Button", points: 1) /// For Actors
            let points = await game.currentPoints /// For Actors
            
//            gameClass.addPoints(source: "Button", points: 1) /// For Class
//            let points = gameClass.currentPoints /// For Class
            
            await MainActor.run {
                self.points = points
            }
        }
    }
    
    func addMoneyGenerator() {
        Task {
            await game.addMoneyGenerator(shouldStart: self.moneyGeneratorsEnabled) /// For Actors
            
//            gameClass.addMoneyGenerator(shouldStart: self.moneyGeneratorsEnabled) /// For Class
        }
    }
    
//    func toggleMoneyGenerators() {
//        moneyGeneratorsEnabled.toggle()
//        Task {
//            await game.toggleMoneyGenerators(enabled: self.moneyGeneratorsEnabled) /// For Actors
//            
////            gameClass.toggleMoneyGenerators(enabled: self.moneyGeneratorsEnabled) /// For Class
//        }
//    }
}
