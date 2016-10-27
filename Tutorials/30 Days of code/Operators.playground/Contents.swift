//: Playground - noun: a place where people can play

import UIKit

var mealCost = Double(12.00)
var tipPrecent = 20
var taxPercent = 8

let tip = mealCost * Double(tipPrecent) / 100
let tax = mealCost * Double(taxPercent) / 100
var totalCost = round(mealCost + tip + tax)

print("The total meal cost is \(Int(totalCost)) dollars.")
