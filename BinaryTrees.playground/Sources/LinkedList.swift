import Foundation

public struct LinkedList<T>: CustomStringConvertible {
    private var head: ListNode<T>?
    private var tail: ListNode<T>?

    public init() { }

    public var isEmpty: Bool {
        return head == nil
    }

    public var first: ListNode<T>? {
        return head
    }

    public mutating func append(_ value: T) {
        let newNode = ListNode(value: value)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    public mutating func remove(_ node: ListNode<T>) -> T {
        let prev = node.previous
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev

        if next == nil {
            tail = prev
        }

        node.previous = nil
        node.next = nil

        return node.value
    }

    public var description: String {
        var text = "["
        var node = head

        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}

public class ListNode<T> {
    public var value: T
    public var next: ListNode<T>?
    public var previous: ListNode<T>?

    public init(value: T) {
        self.value = value
    }
}
