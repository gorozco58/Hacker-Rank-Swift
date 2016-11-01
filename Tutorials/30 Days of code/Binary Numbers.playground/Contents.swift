
func getMax(from numbers: [String], startingAt index: Int) -> Int {
    if index < numbers.count {
        let value = numbers[index].characters.count
        let next = getMax(from: numbers, startingAt: index+1)
        return value > next ? value : next
    } else {
        return 0
    }
}

let n = 245 //--> Int(readLine()!)!
let binary = String(n, radix: 2)
let consecutives = binary.characters.split(separator: "0").map(String.init)
let max = getMax(from: consecutives, startingAt: 0)

print(max)
