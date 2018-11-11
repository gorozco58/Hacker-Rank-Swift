//: [Previous](@previous)

import Foundation

extension BinaryTree where T == String {
    
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
    
    public func numberOfElementsStarting(with string: T) -> Int {
        var node = self.root
        
        while let start = node, string.lowercased() > start.data.lowercased() {
            node = start.right
        }
        
        func numberOfElementsStarting(_ root: Node<T>?) -> Int {
            if let root = root {
                let left = numberOfElementsStarting(root.left)
                let current = root.data.lowercased().starts(with: string.lowercased()) ? 1 : 0
                let right = numberOfElementsStarting(root.right)
                return left + right + current
            }
            return 0
        }
        
        return numberOfElementsStarting(node)
    }
}

var tree = BinaryTree<String>()
tree.insert("Giovanny")
tree.insert("GGio")
tree.insert("Giova")
tree.insert("Orozco")
tree.insert("Loaiza")
tree.insert("G")

tree.numberOfElementsStarting(with: "GG")
tree.numberOfElementsStarting(with: "L")

//: [Next](@next)
