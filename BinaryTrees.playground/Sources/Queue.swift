import Foundation

public struct Queue<T> {

    private var list = LinkedList<T>()

    public init() {}

    public mutating func enqueue(_ element: T) {
        list.append(element)
    }

    public mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }
        return list.remove(element)
    }

    public func peek() -> T? {
        return list.first?.value
    }

    public var isEmpty: Bool {
        return list.isEmpty
    }
}
