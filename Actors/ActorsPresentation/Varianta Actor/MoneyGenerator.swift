//
//  MoneyGenerator.swift
//  ActorsPresentation
//
//  Created by Raul Banut on 21.09.2022.
//

import Foundation

actor MoneyGenerator {
    nonisolated let name: String
    var amountGenerated: Int
    var timeInterval: TimeInterval
    
    private var isRunning = false
    
    init(name: String, amountGenerated: Int, timeInterval: TimeInterval) {
        self.name = name
        self.amountGenerated = amountGenerated
        self.timeInterval = timeInterval
    }
    
    func start(in game: Game) {
        if isRunning {
            return
        }
        
        isRunning = true
        
        Task.detached {
            while await self.isRunning {
                print("\(self.name) is running on thread \(Thread.current)")
                
                await game.addPoints(source: self.name, points: self.amountGenerated)
                try? await Task.sleep(nanoseconds: UInt64(self.timeInterval) * 1_000_000_000)
            }
        }
    }
    
//    func stop() {
//        print("\(self.name) was stopped on thread \(Thread.current)")
//        isRunning = false
//    }
}
