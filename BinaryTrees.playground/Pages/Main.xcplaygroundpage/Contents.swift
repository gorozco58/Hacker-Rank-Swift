import UIKit

//Basics
extension BinaryTree {

    public func lookup(_ value: T) -> T? {
        guard let root = root else {
            return nil
        }
        func lookup(_ root: Node<T>, value: T) -> T? {
            if value == root.data {
                return root.data
            } else if let left = root.left, value < root.data {
                return lookup(left, value: value)
            } else if let right = root.right, value > root.data {
                return lookup(right, value: value)
            }
            return nil
        }

        return lookup(root, value: value)
    }

    public mutating func insert(_ value: T) {
        guard let root = root else {
            self.root = Node(data: value)
            return
        }

        func insert(_ root: Node<T>, value: T) {
            if value < root.data {
                if let left = root.left {
                    insert(left, value: value)
                } else {
                    root.left = Node(data: value)
                }
            } else {
                if let right = root.right {
                    insert(right, value: value)
                } else {
                    root.right = Node(data: value)
                }
            }
        }

        insert(root, value: value)
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
print(tree.jsonDictionary)
tree.lookup(5)
tree.insert(2)
tree.insert(15)
tree.insert(7)
tree.insert(-1)
print(tree.jsonDictionary)

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
tree == tree
tree2 == tree2
tree2 == tree
