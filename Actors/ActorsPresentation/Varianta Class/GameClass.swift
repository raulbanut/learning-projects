//
//  GameClass.swift
//  ActorsPresentation
//
//  Created by Raul Banut on 21.09.2022.
//

import Foundation

class GameClass {
    var currentPoints: Int = 0

    var moneyGenerators: [MoneyGeneratorClass] = []

    func addPoints(source: String, points: Int) {
        let oldPoints = currentPoints
        currentPoints += points
        
        if currentPoints != oldPoints + 1 {
            fatalError("gotcha")
        }
        
        print(source + " added $\(points) on thread \(Thread.current) (\(currentPoints))" )
    }

    func addMoneyGenerator(shouldStart: Bool) {
        let moneyGenerator = MoneyGeneratorClass(
            name: "MoneyGenerator\(moneyGenerators.count)",
            amountGenerated: 1,
            timeInterval: 0.01
        )

        moneyGenerators.append(moneyGenerator)

        if shouldStart {
//            Task {
                moneyGenerator.start(in: self)
//            }
        }

    }

//    func toggleMoneyGenerators(enabled: Bool) {
//        Task.detached {
//            await withTaskGroup(of: Void.self, body: { taskGroup in
//                for moneyGenerator in self.moneyGenerators {
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
