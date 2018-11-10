import Foundation

public struct Stack<Element> {
    private var array: [Element]
    
    public init(array: [Element] = []) {
        self.array = array
    }
    
    public mutating func push(_ element: Element) {
        array.append(element)
    }
    
    public mutating func pop() -> Element? {
        return array.popLast()
    }
    
    public func peek() -> Element? {
        return array.last
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
}
