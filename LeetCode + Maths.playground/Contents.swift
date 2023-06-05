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

//print("\(generate(5))")

func addBinary(_ a: String, _ b: String) -> String {
    guard !a.isEmpty else { return b }
    guard !b.isEmpty else { return a }
    
    var carry = 0
    let a = Array(a)
    let b = Array(b)
    var i = a.count - 1
    var j = b.count - 1
    
    var answer = [Int]()
    
    while i >= 0 || j >= 0 || carry != 0 {
        var sum = carry
        if i >= 0, a[i] == "1" { sum += 1 }
        if j >= 0, b[j] == "1" { sum += 1 }
        
        let digit = sum % 2
        carry = sum / 2
        answer.append(digit)
        
        i -= 1
        j -= 1
    }
    
    return answer.map { String($0) }.reversed().joined()
}

func isHappy(_ n: Int) -> Bool {
    func getSumOfNumbers(_ num: Int) -> Int {
        var sum = 0
        var number = num
        
        while number > 0 {
            let digit = number % 10
            sum += digit * digit
            number /= 10
        }
        
        return sum
    }
    
    var tortoise = n
    var hare = getSumOfNumbers(n)
    
    while hare != 1 && hare != tortoise {
        tortoise = getSumOfNumbers(tortoise)
        hare = getSumOfNumbers(getSumOfNumbers(hare))
    }
    
    return hare == 1
}

isHappy(19)

isHappy(2)

func isNumberRegex(string: String) -> Bool {
    let regex = try? NSRegularExpression(pattern: "^[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?$")
    return regex?.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count)) != nil
}

func isNumber(_ s: String) -> Bool {
    let givenString = s
    var hasE = false
    var hasDot = false
    var hasSign = false
    var hasNum = false
    
    if givenString.hasPrefix("e")
        || givenString.hasSuffix("e")
        || givenString.hasPrefix("E")
        || givenString.hasSuffix("E") { return false }
    
    for currentCharacter in givenString {
        if let _ = Int(String(currentCharacter)) {
            hasNum = true
            continue
        } else if currentCharacter == "e" || currentCharacter == "E" {
            if hasE { return false }
            if !hasNum { return false }
            hasE = true
            hasNum = false
            hasDot = false
            hasSign = false
        } else if currentCharacter == "." {
            if hasE { return false }
            if hasDot { return false }
            hasDot = true
        } else if currentCharacter == "+" || currentCharacter == "-" {
            if hasSign  { return false }
            if !hasE, hasDot { return false }
            if hasNum { return false }
            hasSign = true
            continue
        } else { return false }
    }
    return hasNum
}

print(isNumberRegex(string: "-5654.45"))
print(isNumberRegex(string: "-3."))

print(isNumber("-5654.45"))
print(isNumber("-3."))

addBinary("10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101",
          "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011")


