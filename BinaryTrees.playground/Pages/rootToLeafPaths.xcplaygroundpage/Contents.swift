//: [Previous](@previous)

import Foundation

extension BinaryTree {

    var rootToLeafPaths: [String] {
        func rootToLeafPaths(_ root: Node<T>?, currentPath: String) -> [String] {
            if let root = root {
                let newPath = currentPath + " \(root.data)"
                if root.isLeaf {
                    return [newPath]
                } else {
                    return rootToLeafPaths(root.left, currentPath: newPath) + rootToLeafPaths(root.right, currentPath: newPath)
                }
            }
            return []
        }
        return rootToLeafPaths(root, currentPath: "")
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

tree.rootToLeafPaths
tree2.rootToLeafPaths

//: [Next](@next)
