//: [Previous](@previous)

import Foundation

func isBalanced(s: String) -> Bool {
    let brackets: [Character : Character] = ["{":"}", "[":"]", "(":")"]
    var elements = Stack<Character>()
    
    if s.count % 2 != 0 {
        return false
    }
    
    for character in s {
        if let cb = brackets[character] {
            elements.push(cb)
        } else if let b = elements.peek() {
            if b == character {
                elements.pop()
            } else {
                break
            }
        }
    }
    
    return elements.isEmpty
}

isBalanced(s: "{[()]}")



//: [Next](@next)
