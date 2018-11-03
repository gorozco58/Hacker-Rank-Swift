import Foundation

public class Node<T: Comparable> {
    public let data: T
    public var left: Node<T>?
    public var right: Node<T>?

    public init(data: T, left: Node<T>? = nil, right: Node<T>? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }

    public var description: String {
        return "{ \"value\": \(data), \"left\": \(left?.description ?? "null"), \"right\": \(right?.description ?? "null") }"
    }

    public var jsonDictionary: [String : Any] {
        if let data = description.data(using: .utf8) {
            return try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
        }
        return [:]
    }

    public var isLeaf: Bool {
        return left == nil && right == nil
    }
}

public struct BinaryTree<T: Comparable>: Equatable {

    public var root: Node<T>?

    public init(root: Node<T>? = nil) {
        self.root = root
    }

    public var jsonDictionary: [String : Any] {
        return root?.jsonDictionary ?? [:]
    }

    public static func == (lhs: BinaryTree<T>, rhs: BinaryTree<T>) -> Bool {
        func sameNodes(_ leftNode: Node<T>?, _ rightNode: Node<T>?) -> Bool {
            if let leftNode = leftNode, let rightNode = rightNode {
                let isLeftSame = sameNodes(leftNode.left, rightNode.left)
                let isRightSame = sameNodes(leftNode.right, rightNode.right)
                return isLeftSame && isRightSame && leftNode.data == rightNode.data
            }
            return leftNode == nil && rightNode == nil
        }
        return sameNodes(lhs.root, rhs.root)
    }
}
