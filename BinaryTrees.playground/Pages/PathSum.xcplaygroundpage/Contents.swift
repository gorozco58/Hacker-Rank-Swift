//: [Previous](@previous)

import Foundation

extension BinaryTree where T == Int {

    func hasPathSum(_ sum: T) -> Bool {
        func hasPathSum(_ root: Node<T>?, pathSum: T) -> Bool {
            if let root = root, pathSum < sum {
                let currentSum = pathSum + root.data
                if root.isLeaf {
                    return currentSum == sum
                } else {
                    return hasPathSum(root.left, pathSum: currentSum) || hasPathSum(root.right, pathSum: currentSum)
                }
            }
            return false
        }
        return hasPathSum(root, pathSum: 0)
    }

    func pathsWithSum(_ sum: T) -> [String] {
        func pathsWithSum(_ root: Node<T>?, pathSum: T = 0, currentPath: String = "") -> [String] {
            if let root = root, pathSum < sum {
                let currentSum = pathSum + root.data
                let newPath = currentPath + "\(root.data) "
                if root.isLeaf {
                    return currentSum == sum ? [newPath] : []
                } else {
                    return pathsWithSum(root.left, pathSum: currentSum, currentPath: newPath) + pathsWithSum(root.right, pathSum: currentSum, currentPath: newPath)
                }
            }
            return []
        }
        return pathsWithSum(root)
    }
}

let root = Node(data: 10,
                 left: Node(data: 5,
                            left: Node(data: 4),
                            right: Node(data: 7)),
                 right: Node(data: 12))
let tree = BinaryTree(root: root)
print(tree.pathsWithSum(22))

let root2 = Node(data: 5,
                 left: Node(data: 4,
                            left: Node(data: 11,
                                       left: Node(data: 7),
                                       right: Node(data: 2))),
                 right: Node(data: 8,
                             left: Node(data: 13),
                             right: Node(data: 4,
                                         right: Node(data: 1))))
let tree2 = BinaryTree(root: root2)
tree2.hasPathSum(18)
print(tree2.pathsWithSum(18))


//: [Next](@next)
