//: [Previous](@previous)

import Foundation

extension BinaryTree {

    var mirror: BinaryTree {
        func mirror(_ root: Node<T>?) -> Node<T>? {
            if let root = root {
                let left = root.left
                let right = root.right
                root.left = right
                root.right = left
                mirror(left)
                mirror(right)
            }
            return root
        }
        return BinaryTree(root: mirror(root))
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
print(tree.mirror.jsonDictionary)

//: [Next](@next)
