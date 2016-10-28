import Foundation

//Hacker rank imputs
//let inputs = readLine()!.componentsSeparatedByString(" ").map { Int(String($0))! }
//let count = inputs[0]
//let torations = inputs[1]

let torations = 4
var elements = [1,2,3,4,5] //readLine()!.componentsSeparatedByString(" ").map { Int(String($0))! }

for _ in 0 ..< torations {
    let element = elements[0]
    elements.removeFirst()
    elements.append(element)
}

let string = elements.reduce("") {
    
    var string = "\($0) \($1)"
    
    //Fix compiler error
    if string.characters.first == " " {
        string = "\($1)"
    }
    
    return string
}

print(string)
