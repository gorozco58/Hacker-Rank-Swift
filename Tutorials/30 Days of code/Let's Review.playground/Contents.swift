var t = 2 // changet to --> Int(readLine()!)!

func getCharacters(from characters: [String], startingAt index: Int) -> String {
    
    if index <= characters.count-1 {
        var character = characters[index]
        character = character + getCharacters(from: characters, startingAt: index+2)
        return character
    }
    
    return ""
}

let strings = ["Hacker", "Rank"]
var currentIndex = 0

while t > 0 {
    
    let s = strings[currentIndex] //change to --> readLine(stripNewline: true)!
    let characters = s.characters.map { String($0) }
    let evenCharacters = getCharacters(from: characters, startingAt: 0)
    let oddCharacters = getCharacters(from: characters, startingAt: 1)
    print("\(evenCharacters) \(oddCharacters)")
    
    currentIndex += 1
    t -= 1
}
