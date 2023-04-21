import UIKit

public class TreeNode {
    public var val: Int?
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    var maxLength = 0
    
    /// Recursive func to go ZigZag inside the tree
    /// - Parameters:
    ///   - root: root
    ///   - direction: the direction, 0 is for left and 1 is for right
    ///   - currentLength: current length
    func solve(root: TreeNode?, direction: Int, currentLength: Int) {
        if root == nil { return }
        maxLength = max(maxLength, currentLength)
        
        if direction == 1 {
            solve(root: root?.left, direction: 0, currentLength: currentLength + 1)
            solve(root: root?.right, direction: 1, currentLength: 1)
        } else {
            solve(root: root?.right, direction: 1, currentLength: currentLength + 1)
            solve(root: root?.left, direction: 0, currentLength: 1)
        }
    }
    
    func longestZigZag(_ root: TreeNode?) -> Int {
        solve(root: root, direction: 0, currentLength: 0)
        solve(root: root, direction: 1, currentLength: 0)
        return maxLength
    }
    
    func height(root: TreeNode?) -> Int {
        if root == nil { return 0 }
        else {
            var leftHeight = height(root: root?.left)
            var rightHeight = height(root: root?.right)
            
            if leftHeight > rightHeight {
                return leftHeight + 1
            } else {
                return rightHeight + 1
            }
        }
    }
}

var solution = Solution()
