import UIKit
import Foundation

func isPowerOfThree(_ n: Int) -> Bool {
    if n <= 0 {
        return false
    }
    
    return modf(log(Float(n)) / log(3.0)).1 == 0 ? true : false
}


func isPowerOfThreeCorrect(_ n: Int) -> Bool {
    if n <= 0 {return false}
    var r = (log(Double(n))/log(3.0)).rounded()
    return n == Int(pow(3, r))
}

func generate(_ numRows: Int) -> [[Int]] {
    var returnRows: [[Int]] = []

    for currentRow in 0 ..< numRows {
        var rowResult: [Int] = []

        for index in 0 ... currentRow {
            if index == 0 || index == currentRow {
                rowResult.append(1)
            } else {
                let value = returnRows[currentRow - 1][index - 1] + returnRows[currentRow - 1][index]
                rowResult.append(value)
            }
        }

        returnRows.append(rowResult)
    }

    return returnRows
}

print("\(generate(5))")
