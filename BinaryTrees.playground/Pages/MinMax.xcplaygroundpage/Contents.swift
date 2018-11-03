//: [Previous](@previous)

import Foundation

extension BinaryTree {

    var min: T? {
        var node = root
        while let left = node?.left {
            node = left
        }
        return node?.data
    }

    var max: T? {
        var node = root
        while let right = node?.right {
            node = right
        }
        return node?.data
    }
}

let root = Node(data: 5,
                left: Node(data: 3,
                           left: Node(data: 1),
                           right: Node(data: 4)),
                right: Node(data: 9,
                            left: Node(data: 6),
                            right: Node(data: 10)))
var tree = BinaryTree(root: root)
tree.min
tree.max

//: [Next](@next)
