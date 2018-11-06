import UIKit

func numWaysBottomUp(_ stairs: Int, _ steps: [Int]) -> Int {
    if stairs == 0 {
        return 1
    }
    
    var ways = Array(repeating: 0, count: stairs + 1)
    ways[0] = 1
    
    for stair in stride(from: 1, to: stairs+1, by: 1) {
        var total = 0
        for step in steps {
            let nextStep = stair - step
            if nextStep >= 0 {
                total += ways[nextStep]
            }
        }
        ways[stair] = total
    }
    return ways[stairs]
}

numWaysBottomUp(5, [1, 2])
