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

func countSets(_ elements: [Int], total: Int) -> Int {
    func helper(_ total: Int, _ index: Int, mem: inout [String : Int]) -> Int {

        let key = "\(total):\(index)"
        var result = 0

        if let result = mem[key] {
            return result
        } else if total < elements[index] {
            result = helper(total, index - 1, mem: &mem)
        } else {
            let rest = total - elements[index]
            let next = index - 1

            func validate(_ value: Int) -> Int {
                return (value < 0 || next < 0) ? 0 : helper(value, next, mem: &mem)
            }
            result = (rest == 0 ? 1 : validate(rest)) + validate(total)
        }

        mem[key] = result
        return result
    }
    var mem: [String : Int] = [:]
    return helper(total, elements.count-1, mem: &mem)
}

countSets([2,4,6,10,12], total: 16)
