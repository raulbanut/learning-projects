//
//  Game.swift
//  ActorsPresentation
//
//  Created by Raul Banut on 21.09.2022.
//

import Foundation

actor Test {
    var a: Int = 1
    var b: Int = 2
}

class TestClass {
    func add() {
        let test = Test()
        
        Task {
            async let A = test.a
            async let B = test.b
            
            let sum = await A + B
         
            print("\(sum)")
        }
    }
}

actor Game {
    var currentPoints: Int = 0
    
    var moneyGenerators: [MoneyGenerator] = []
    
    func addPoints(source: String, points: Int) {
        let oldPoints = currentPoints
        currentPoints += points
        
        if currentPoints != oldPoints + 1 {
            fatalError("gotcha")
        }
        
        print(source + " added $\(points) on thread \(Thread.current) (\(currentPoints))" )
    }
    
    func addMoneyGenerator(shouldStart: Bool) {
        let moneyGenerator = MoneyGenerator(
            name: "MoneyGenerator\(moneyGenerators.count)",
            amountGenerated: 1,
            timeInterval: 1
        )
        
        moneyGenerators.append(moneyGenerator)
        
        if shouldStart {
            Task {
                await moneyGenerator.start(in: self)
            }
        }
    
    }
    
//    func toggleMoneyGenerators(enabled: Bool) {
//        Task.detached {
//            await withTaskGroup(of: Void.self, body: { taskGroup in
//                for moneyGenerator in await self.moneyGenerators {
//                    taskGroup.addTask {
//                        if enabled {
//                            await moneyGenerator.start(in: self)
//                        } else {
//                            await moneyGenerator.stop()
//                        }
//                    }
//                }
//            })
//        }
//    }
}
