//: [Previous](@previous)

import Foundation

func isBalanced(s: String) -> Bool {
    let length = s.count
    var isBalanced = true
    let brackets = ["{":"}", "[":"]", "(":")"]
    
    if length % 2 != 0 {
        return false
    }
    
    for index in stride(from: 0, to: length/2, by: 1) {
        let leftCharacter = s[index]
        let rightCharacter = s[length - index - 1]
        if brackets[leftCharacter] != rightCharacter {
            isBalanced = false
            break
        }
    }
    
    return isBalanced
}

isBalanced(s: "{[()]}")



//: [Next](@next)
