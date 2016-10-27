//: Playground - noun: a place where people can play

import UIKit

let n = 3 //change the number in order to get diffrent results

if n % 2 != 0 {
    print("Weird")
} else if n % 2 == 0 && (n >= 2 && n < 5) {
    print("Not Weird")
} else if n % 2 == 0 && (n >= 6 && n <= 20) {
    print("Weird")
} else if n % 2 == 0 && n > 20 {
    print("Not Weird")
}

