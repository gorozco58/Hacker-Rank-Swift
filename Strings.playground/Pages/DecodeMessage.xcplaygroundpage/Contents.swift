import UIKit

//Decode message
func numWaysRecursion(_ message: String) -> Int {
    
    func helper(_ k: Int, memo: inout [Int?]) -> Int {
        let index = message.count - k
        
        if k == 0 {
            return 1
        }
        if message[index] == "0" {
            return 0
        }
        if let result = memo[k-1] {
            return result
        }
        
        var result = helper(k - 1, memo: &memo)
        let nextNumber = Int(message[index ..< index+2])!
        
        if k >= 2 && nextNumber <= 26 {
            result += helper(k - 2, memo: &memo)
        }
        memo[k-1] = result
        return result
    }
    var memo: [Int?] = Array(repeating: nil, count: message.count)
    return helper(message.count, memo: &memo)
}



func numWaysDP(_ message: String) -> Int {
    if message.isEmpty {
        return 1
    }
    let length = message.count
    var numWays = Array(repeating: 0, count: length)
    
    for (index, character) in message.enumerated() {
        switch index {
        case 0:
            if character == "0" { return 0 }
            numWays[0] = 1
        case 1:
            let previousCharacter = message[0]
            if Int(previousCharacter+String(character))! <= 26 {
                    numWays[1] = 2
            }
        default:
            let num = message[index-1] + String(character)
            if num == "00" { return 0 }
            numWays[index] = numWays[index-1]
            
            if Int(num)! <= 26 {
                numWays[index] += numWays[index-2]
            }
        }
    }
    return numWays[length-1]
}

numWaysRecursion("1111")
numWaysDP("1111")
