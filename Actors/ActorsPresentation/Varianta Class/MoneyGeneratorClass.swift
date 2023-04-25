//
//  MoneyGeneratorClass.swift
//  ActorsPresentation
//
//  Created by Raul Banut on 21.09.2022.
//

import Foundation

class MoneyGeneratorClass {
    nonisolated let name: String
    var amountGenerated: Int
    var timeInterval: TimeInterval
    
    private var isRunning = false
    
    init(name: String, amountGenerated: Int, timeInterval: TimeInterval) {
        self.name = name
        self.amountGenerated = amountGenerated
        self.timeInterval = timeInterval
    }
    
    func start(in game: GameClass) {
        if isRunning {
            return
        }
       
        isRunning = true
        
        Task.detached(priority: .high) {
            while self.isRunning {
                game.addPoints(source: self.name, points: self.amountGenerated)
                try? await Task.sleep(nanoseconds: 1_000_000_000 * 1)
            }
        }
    }
    
//    func stop() {
//        print("\(self.name) was stopped on thread \(Thread.current)")
//        isRunning = false
//    }
}
