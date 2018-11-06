//: [Previous](@previous)

import Foundation

extension BinaryTree where T == Int {
    
    func closestNode(_ value: T) -> Node<T>? {
        func closestNode(_ value: T, _ root: Node<T>?) -> Node<T>? {
            var closest: Node<T>? = nil
            var minDistance = Int.max
            var node = root
            
            while let currentNode = node, minDistance != 0 {
                let distance = abs(currentNode.data - value)
                if distance < minDistance {
                    minDistance = distance
                    closest = currentNode
                }
                
                if currentNode.data > value {
                    node = currentNode.left
                } else if currentNode.data < value {
                    node = currentNode.right
                }
            }
            return closest
        }
        return closestNode(value, root)
    }
    
    func nodesWithSum(_ sum: T) -> (Int, Int)? {
        func nodesWithSum(root: Node<T>?, memo: inout Set<T>) -> (Int, Int)? {
            if let node = root {
                if memo.contains(sum-node.data) {
                    return (node.data, sum - node.data)
                } else {
                    memo.insert(node.data)
                    if let sum = nodesWithSum(root: node.left, memo: &memo) {
                        return sum
                    } else if let sum = nodesWithSum(root: node.right, memo: &memo) {
                        return sum
                    }
                }
            }
            return nil
        }
        var memo = Set<T>()
        return nodesWithSum(root: root, memo: &memo)
    }
}

let root = Node(data: 32,
                left: Node(data: 24,
                           left: Node(data: 21,
                                      left: Node(data: 14)),
                           right: Node(data: 28,
                                       left: Node(data: 25),
                                       right: Node(data: 31))),
                right: Node(data: 41,
                            left: Node(data: 36,
                                       right: Node(data: 39)),
                            right: Node(data: 47)))
let tree = BinaryTree(root: root)
tree.closestNode(28)?.data

tree.nodesWithSum(61)
tree.nodesWithSum(45)

//: [Next](@next)
