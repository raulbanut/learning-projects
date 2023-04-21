import UIKit

class Solution {
    
    /// 1 -- longest substring
    /// print("\n MAX = \(solution.lengthOfLongestSubstring("pwwkew"))")
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var longestSubstringCharacters = [Character: Int]()
        var maxSubstringLength = 0
        var startIndex = 0
        
        for (index, currentCharacter) in s.enumerated() {
            if longestSubstringCharacters[currentCharacter] != nil
                && startIndex <= longestSubstringCharacters[currentCharacter]! {
                startIndex = longestSubstringCharacters[currentCharacter]! + 1
            }
            longestSubstringCharacters[currentCharacter] = index
            
            let currentSubstringLength = (index - startIndex) + 1
            maxSubstringLength = max(maxSubstringLength, currentSubstringLength)
        }
        
        return maxSubstringLength
    }
    
    /// 2 - decode a message
    /// solution.decodeMessage("the quick brown fox jumps over the lazy dog", "vkbs bs t suepuv")
    func decodeMessage(_ key: String, _ message: String) -> String {
        var alphabet = "abcdefghijklmnopqrstuvwxyz"
        var newMessage = ""
        var newKey = [Character]()
        var dictionary = [Character: Character]()
        
        var removedSpacesInKey = key.filter { char in
            if char != " " && !newKey.contains(char) {
                newKey.append(char)
            }
            return !char.isWhitespace
        }
        
        for (index, value) in alphabet.enumerated() {
            dictionary[value] = newKey[index]
        }
        
        let sortedDictionary = dictionary.keys.sorted()
        
        for char in message {
            newMessage += char == " " ? " " : ""
            for key in sortedDictionary {
                if char == dictionary[key]! {
                    newMessage += String(key)
                }
            }
            
            
        }
        
        return newMessage
    }
    
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        //        Slow implementation
        //        if countWord1 <= 0 {
        //            return word2
        //        }
        //        else if countWord2 <= 0 {
        //            return word1
        //        }
        //
        //        var smallerString: String, biggerString: String
        //
        //        if countWord1 > countWord2 {
        //            smallerString = word2
        //            biggerString = word1
        //        } else {
        //            smallerString = word1
        //            biggerString = word2
        //        }
        //
        //        var newWord = ""
        //
        //        for index in 0..<smallerString.count {
        //            newWord = newWord + "\(String(Array(word1)[index]))" + "\(String(Array(word2)[index]))"
        //        }
        //
        //        for index in smallerString.count..<biggerString.count {
        //            newWord = newWord + "\(String(Array(biggerString)[index]))"
        //        }
        //
        //        return newWord
        let word1 = Array(word1)
        let word2 = Array(word2)
        let countWord1 = word1.count
        let countWord2 = word2.count
        var result = [Character]()
        
        for index in 0..<(max(countWord1, countWord2) * 2) {
            let half = index / 2
            if index % 2 == 0 {
                if half < countWord1 { result.append(word1[half]) }
            } else {
                if half < countWord2 { result.append(word2[half]) }
            }
            
            print("index -- \(index) || half -- \(half) || result -- \(result)")
        }
        
        return String(result)
    }
    
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var s = Array(s)
        var t = Array(t)
        
        var sSum = 0
        var tSum = 0
        
        for index in 0..<t.count {
            if index != t.count - 1 {
                sSum += Int(s[index].asciiValue!)
            }
            tSum += Int(t[index].asciiValue!)
        }
        
        return Character(UnicodeScalar(tSum -  sSum)!)
    }
}

var solution = Solution()

solution.findTheDifference("abcd", "abedc")
