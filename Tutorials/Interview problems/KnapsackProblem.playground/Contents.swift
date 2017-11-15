import Foundation

let knapWieght = 7
let itemsWeight = [1, 3, 4, 5]
let itemsValue = [1, 4, 5, 7]
let totalItems = itemsValue.count

func maxValue() {
    var weights: [[Int]] = Array(0..<totalItems).map { _ in [] }

    for itemRow in 0..<totalItems {
        for maxWeight in 0...knapWieght {

            let itemWeight = itemsWeight[itemRow]
            let itemValue = itemsValue[itemRow]
            let lastIndex = itemRow - 1

            if lastIndex >= 0 {
                let lastValue = weights[lastIndex][maxWeight]
                if itemWeight <= maxWeight {
                    let adition = weights[lastIndex][maxWeight - itemWeight]
                    let value = max(itemValue + adition, lastValue)
                    weights[itemRow].insert(value, at: maxWeight)
                } else {
                    weights[itemRow].insert(lastValue, at: maxWeight)
                }
            } else {
                if itemWeight <= maxWeight {
                    weights[itemRow].insert(itemValue, at: maxWeight)
                } else {
                    weights[itemRow].insert(0, at: maxWeight)
                }
            }
        }
    }

    weights.forEach {
        print("\($0)\n")
    }
}

maxValue()

