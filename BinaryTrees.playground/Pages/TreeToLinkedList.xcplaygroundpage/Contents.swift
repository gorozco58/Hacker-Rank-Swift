//: [Previous](@previous)

import Foundation

extension BinaryTree {

    func toLinkedList() -> (head: Node<T>?, tail: Node<T>?) {
        func toLinkedList(_ root: Node<T>?) -> (head: Node<T>?, tail: Node<T>?) {
            if let root = root {
                var head: Node<T>? = root
                var tail: Node<T>? = root

                if let left = root.left {
                    let leftSubtree = toLinkedList(left)
                    root.left = leftSubtree.tail
                    leftSubtree.tail?.right = root
                    head = leftSubtree.head
                }

                if let right = root.right {
                    let rightSubtree = toLinkedList(right)
                    root.right = rightSubtree.head
                    rightSubtree.head?.left = root
                    tail = rightSubtree.tail
                }

                return (head, tail)
            }
            return (nil, nil)
        }
        return toLinkedList(root)
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

var (head, tail) = tree.toLinkedList()
head?.data
tail?.data

while let node = head {
    print("root: \(node.data), left: \(node.left?.data ?? -1), right: \(node.right?.data ?? -1)")
    head = head?.right
}


//: [Next](@next)
