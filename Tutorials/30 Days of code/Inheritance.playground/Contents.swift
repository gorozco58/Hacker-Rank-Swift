
//This code is provided for Hacker rank
// Class Person
class Person {
    var firstName: String
    var lastName: String
    var id: Int
    
    // Initializer
    init(firstName: String, lastName: String, identification: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = identification
    }
    
    // Print person data
    func printPerson() {
        print("Name: \(self.lastName), \(self.firstName)")
        print("ID: \(self.id)")
    }
} // End of class Person



// Class Student
class Student: Person {
    var testScores: [Int]
    
    // Write the Student class initializer
    init(firstName: String, lastName: String, identification: Int, scores: [Int]) {
        self.testScores = scores
        super.init(firstName: firstName, lastName: lastName, identification: identification)
    }
    
    // Write the calculate method
    func calculate() -> String {
        
        let average = testScores.reduce(0) { $0 + $1 } / testScores.count
        
        switch average {
        case 0..<40:
            return "T"
        case 40..<55:
            return "D"
        case 55..<70:
            return "P"
        case 70..<80:
            return "A"
        case 80..<90:
            return "E"
        case 90...100:
            return "O"
        default:
            return ""
        }
    }
}



//let nameAndID = readLine()!.characters.split(" ").map{String($0)}
//let scoreCount = readLine()
//let scores = readLine()!.characters.split(" ").map{Int(String($0))!}

//test imputs
let nameAndID = ["Heraldo", "Memelli", "8135627"]
let scoreCount = 2
let scores = [100, 80]

let s = Student(firstName: nameAndID[0], lastName: nameAndID[1], identification: Int(nameAndID[2])!, scores: scores)

s.printPerson()

print("Grade: \(s.calculate())")
