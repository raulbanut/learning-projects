import UIKit

class Solution {
    func countOperationsToEmptyArray(_ nums: [Int]) -> Int {
        let sortedNums = nums.enumerated().sorted { $0.1 < $1.1 }
        print(sortedNums)
        var numberOfOperations = nums.count
        
        
        print("sortedNums.indices.dropLast() \(sortedNums.indices.dropLast())")
        
        for i in sortedNums.indices.dropLast() where sortedNums[i].0 > sortedNums[i+1].0 {
            print("numberOfOperations \(numberOfOperations)")
            print("where sortedNums[i].0 > sortedNums[i+1].0 \(sortedNums[i].1) \(sortedNums[i+1].1)")
            numberOfOperations += nums.count - (i+1)
        }
        
        return numberOfOperations
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var buy = prices[0]
        var sell = prices[0]
        
        for price in prices {
            if buy > price {
                maxProfit = max(maxProfit, sell - buy)
                buy = price
                sell = price
            } else {
                sell = max(sell, price)
            }
        }
        
        maxProfit = max(maxProfit, sell - buy)
        
        return maxProfit
    }
    
    func validMountainArray(_ arr: [Int]) -> Bool {
        if arr.count < 3 { return false }
        
        var index = 0
        
        while index + 1 < arr.count && arr[index] < arr[index + 1] {
            print(arr[index])
            index += 1
        }
        
        if index == 0 || index == arr.count - 1 {
            return false
        }
        
        while index + 1 < arr.count && arr[index] > arr[index + 1] {
            index += 1
        }
        
        return index == arr.count - 1
    }
}

var solution = Solution()

solution.validMountainArray( [ 3,4,5 ] )

//solution.maxProfit( [1,2] )
//solution.maxProfit( [7,6,4,3,1] )
//solution.maxProfit( [7,1,5,3,6,4] )
//
//solution.countOperationsToEmptyArray([-2,23,5,1,-7,4, -1])
//solution.countOperationsToEmptyArray([])
