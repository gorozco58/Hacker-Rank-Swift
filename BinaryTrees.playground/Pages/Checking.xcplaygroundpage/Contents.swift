//: [Previous](@previous)

import Foundation

extension BinaryTree where T == Int {

    var isBST: Bool {

        func isBSTUtil(_ node: Node<T>?, min: T, max: T) -> Bool {
            guard let node = node else { return true }
            if node.data <= min || node.data >= max {
                return false
            }
            return isBSTUtil(node.left, min: min, max: node.data) && isBSTUtil(node.right, min: node.data, max: max)
        }

        func isBST(_ root: Node<T>?) -> Bool {
            return isBSTUtil(root, min: Int.min, max: Int.max)
        }

        return isBST(root)
    }

    static func verifySequenceOfBST(_ sequence: [T], length: Int) -> Bool {

        let root = sequence[length-1]
        let rightStartIndex = sequence.firstIndex { $0 > root } ?? 0
        let leftElements = Array(sequence[0..<rightStartIndex])
        let rightElements = Array(sequence[rightStartIndex..<length-1])

        if !rightElements.allSatisfy({ $0 > root }) {
            return false
        }

        var leftIsBST = true
        var rightIsBST = true

        if leftElements.count > 1 {
            leftIsBST = verifySequenceOfBST(leftElements, length: rightStartIndex)
        } else if !leftElements.isEmpty {
            leftIsBST = leftElements[0] < root
        }

        if rightElements.count > 1 && leftIsBST {
            rightIsBST = verifySequenceOfBST(rightElements, length: length - rightStartIndex - 1)
        } else if !rightElements.isEmpty {
            rightIsBST = rightElements[0] > root
        }

        return leftIsBST && rightIsBST
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

tree.isBST
tree2.isBST

let array = [5, 7, 6, 9, 11, 10, 8]
BinaryTree.verifySequenceOfBST(array, length: array.count)

//: [Next](@next)
