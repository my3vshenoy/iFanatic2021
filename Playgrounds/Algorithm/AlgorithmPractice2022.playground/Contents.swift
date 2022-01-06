import UIKit

var greeting = "Hello, playground"

// Fredric Gauss Technique
// Sum n numbers
func sumFromOne(to n: Int) -> Int {
    (n+1) * n/2 // O(1)
}

// Sum n numbers
// O(n)
func sum(to n: Int) -> Int {
    var result = 0
    for number in 1...n { // O(n)
        result += number
    }
    
    return result
}

sumFromOne(to: 10)
sum(to: 10)
