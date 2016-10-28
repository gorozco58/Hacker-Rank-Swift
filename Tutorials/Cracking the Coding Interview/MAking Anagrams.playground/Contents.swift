
func getFrequency(from text: [String]) -> [String : Int] {
    
    var frequency: [String : Int] = [:]
    
    text.forEach {
        if let times = frequency[$0] {
            frequency[$0] = times + 1
        } else {
            frequency[$0] = 1
        }
    }
    
    return frequency
}

func deference(from f1: inout [String : Int], to f2: inout [String : Int]) -> Int {
    
    var deleted = 0
    
    for (key2, times2) in f2 {
        if let times1 = f1[key2] {
            f1[key2] = nil
            deleted = deleted + abs(times1 - times2)
        } else {
            deleted = deleted + times2
        }
    }
    
    return deleted
}

//change string to readLine()!
var frequency1 = getFrequency(from: "cde".characters.map { String($0) })
var frequency2 = getFrequency(from: "abc".characters.map { String($0) })
let deleted = deference(from: &frequency1, to: &frequency2) + deference(from: &frequency2, to: &frequency1)

print(deleted)

