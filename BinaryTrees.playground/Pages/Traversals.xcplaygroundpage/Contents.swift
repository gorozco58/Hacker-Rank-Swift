//: [Previous](@previous)

import Foundation

extension BinaryTree {

    func preorder() -> [T] {
        func preorder(_ root: Node<T>?) -> [T] {
            if let root = root {
                return [root.data] + preorder(root.left) + preorder(root.right)
            } else {
                return []
            }

        }
        return preorder(root)
    }

    func inorder() -> [T] {
        func inorder(_ root: Node<T>?) -> [T] {
            if let root = root {
                return inorder(root.left) + [root.data] + inorder(root.right)
            } else {
                return []
            }

        }
        return inorder(root)
    }

    func postorder() -> [T] {
        func postorder(_ root: Node<T>?) -> [T] {
            if let root = root {
                return postorder(root.left) + postorder(root.right) + [root.data]
            } else {
                return []
            }
        }
        return postorder(root)
    }

    func bfs() -> [T] {
        guard let root = root else { return [] }
        var queue = Queue<Node<T>>()
        var elements: [T] = []
        queue.enqueue(root)

        while !queue.isEmpty {
            if let temp = queue.dequeue() {
                elements.append(temp.data)

                if let left = temp.left {
                    queue.enqueue(left)
                }
                if let right = temp.right {
                    queue.enqueue(right)
                }
            }
        }

        return elements
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
tree.preorder()
tree.inorder()
tree.postorder()
tree.bfs()

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
tree2.preorder()
tree2.inorder()
tree2.postorder()
tree2.bfs()
//: [Next](@next)
