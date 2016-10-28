//example input
//3
//sam 99912222
//tom 11122222
//harry 12299933
//sam
//edward
//harry

let n = readLine()!
var elements: [String : String] = [:]

while let value = readLine(strippingNewline: true) {
    
    let values = value.characters.split(separator: " ").map(String.init)
    
    if values.count > 1 {
        elements[values.first!] = values.last
    } else {
        if let phone = elements[value] {
            print("\(value)=\(phone)")
        } else {
            print("Not found")
        }
    }
}
