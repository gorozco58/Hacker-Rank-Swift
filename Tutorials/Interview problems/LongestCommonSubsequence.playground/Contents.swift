//: Playground - noun: a place where people can play

import UIKit

extension String {

    var length: Int {
        return self.characters.count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }

}

func lengthOfLongestCommonSubsequence(stringA: String, stringB: String) {
    guard stringA.count > 0 && stringB.count > 0 else {
        return
    }

    var result: [[Int]] = Array(0...stringA.count).map { _ in Array(0...stringB.count).map { _ in 0 } }

    for i in stride(from: 1, to: Int(stringA.count+1), by: 1) {
        for j in stride(from: 1, to: Int(stringB.count+1), by: 1) {
            if stringA[i - 1] == stringB[j - 1] {
                result[i][j] = 1 + result[i - 1][j - 1]
            } else {
                // If last characters of both sequences don't match we take the maximum value between
                // one subsequence without the last character and the other subsequence
                result[i][j] = max(result[i][j - 1], result[i - 1][j])
            }
        }
    }

    print(result)
}

lengthOfLongestCommonSubsequence(stringA: "AGGTAB", stringB: "GXTXAYB")
