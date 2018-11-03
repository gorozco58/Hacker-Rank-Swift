//: [Previous](@previous)

import Foundation

//Size
extension BinaryTree {

    var size: Int {
        func size(_ root: Node<T>?) -> Int {
            if let root = root {
                return size(root.left) + size(root.right) + 1
            } else {
                return 0
            }
        }

        return size(root)
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
tree.size


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
tree2.size
//: [Next](@next)
