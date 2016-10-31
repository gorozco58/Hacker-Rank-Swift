
let number = 5 //--> Int(readLine()!)!

func factorial(n: Int) -> Int {
    return n > 1 ? n * factorial(n: n-1) : n
}

print(factorial(n: number))
