//: Playground - noun: a place where people can play

import Foundation

func countWays(from coins: [Int], total: Int) {

    //Time complexity of this function: O(mn)
    //Space Complexity of this function: O(n)

    // table[i] will be storing the number of solutions
    // for value i. We need n+1 rows as the table is
    // constructed in bottom up manner using the base
    // case (n = 0)
    var values: [Int] = Array(0...total).map { _ in 0 }

    // Base case (If given value is 0)
    values[0] = 1

    for i in stride(from: 0, to: coins.count, by: 1) {
        print("\n \(i)")
        for j in stride(from: coins[i], to: total+1, by: 1) {
            values[j] += values[j - coins[i]]
        }
        print(values)
    }
}

countWays(from: [1, 2, 3, 0], total: 4)
