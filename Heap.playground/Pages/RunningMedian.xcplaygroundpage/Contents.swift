//: [Previous](@previous)

import Foundation

func runningMedian(a: [Int]) -> [Double] {
    var medians: [Double] = []
    var leftHeap = Heap<Int>(priorityFunction: >)
    var rightHeap = Heap<Int>(priorityFunction: <)
    
    for (index, number) in a.enumerated() {
        if index == 0 {
            medians.append(Double(number))
        } else if index == 1 {
            leftHeap.enqueue(min(a[index-1], number))
            rightHeap.enqueue(max(a[index-1], number))
            medians.append(Double(a[index-1] + number) / 2.0)
        } else {
            if Double(number) > medians[index-1] {
                rightHeap.enqueue(number)
            } else {
                leftHeap.enqueue(number)
            }
            
            let media: Double
            
            if leftHeap.count == rightHeap.count {
                
                media = Double(leftHeap.peek()! + rightHeap.peek()!) / 2.0
                
            } else if abs(leftHeap.count - rightHeap.count) == 1 {
                
                let midValue = leftHeap.count > rightHeap.count ? leftHeap.peek()! : rightHeap.peek()!
                media = Double(midValue)
                
            } else {
                if leftHeap.count > rightHeap.count {
                    rightHeap.enqueue(leftHeap.dequeue()!)
                } else {
                    leftHeap.enqueue(rightHeap.dequeue()!)
                }
                media = Double(leftHeap.peek()! + rightHeap.peek()!) / 2.0
            }
            
            medians.append(media)
        }
    }
    
    return medians
}

let medias = runningMedian(a: [29689 ,61859 ,43888 ,90223])


//: [Next](@next)
