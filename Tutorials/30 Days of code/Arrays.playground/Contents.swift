// number of elements
var n = 4 //change to --> Int(readLine()!)!
let elements =  "1 4 3 2" //change to --> readLine()!
var arr = elements.characters.split(separator: " ").map(String.init)
print(arr.reversed().joined(separator: " "))
