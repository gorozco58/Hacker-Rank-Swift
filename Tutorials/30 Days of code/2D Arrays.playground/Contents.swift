
var values: [[Int]] = [ [-1, -1, 0, -9, -2, -2],
                         [-2, -1, -6, -8, -2, -5],
                         [-1, -1, -1, -2, -3, -4],
                         [-1, -9, -2, -4, -4, -5],
                         [-7, -3, -3, -2, -9, -9],
                         [-1, -3, -1, -2, -4, -5]]

/* take values from hacker rank
 var values: [[Int]] = []
 
 while let array = readLine(stripNewline: true) {
 let elements = array.characters.split(" ").flatMap { Int(String($0)) }
 values.append(elements)
 }
 */

func maxSum(from values: [[Int]], startingAt index: Int, maxValue: Int) -> Int {
    
    let row = values[index]
    let maxRow = internalSum(from: values, into: row, topIndex: index, innerIndex: 0)
    var currentMax = maxRow > maxValue ? maxRow : maxValue
    
    if index < values.count-3 {
        let next = maxSum(from: values, startingAt: index+1, maxValue: currentMax)
        currentMax = next > currentMax ? next : currentMax
    }
    
    return currentMax
}

func internalSum(from values: [[Int]], into row: [Int], topIndex: Int, innerIndex: Int) -> Int {
    
    let top = row[innerIndex..<innerIndex+3].reduce(0) { $0 + $1 }
    let middle = values[topIndex+1][innerIndex+1]
    let bottom = values[topIndex+2][innerIndex..<innerIndex+3].reduce(0) { $0 + $1 }
    var sum = top + middle + bottom
    
    if innerIndex < row.count-3 {
        let next = internalSum(from: values, into: row, topIndex: topIndex, innerIndex: innerIndex+1)
        sum = next > sum ? next : sum
    }
    
    return sum
}

let max = maxSum(from: values, startingAt: 0, maxValue: -63)
print(max)
