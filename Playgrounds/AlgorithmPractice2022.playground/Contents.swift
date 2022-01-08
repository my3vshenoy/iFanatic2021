import UIKit

var greeting = "Hello, playground"
// ===========================================
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
// ==============================================

// MARK: - Stack
// See Stack.swift

// Create a stack of Ints
var stack = Stack<Int>()

// Push elements onto the Stack
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)

// Print the stack
print(stack.description)

// Pop elements onto the Stack
stack.pop()
stack.pop()
stack.pop()
stack.pop()

stack.description

// Add array into the stack instead of 1 element at a time
let array = [1, 2, 3, 4]
var stackTwo = Stack(array)
stackTwo.description
stackTwo.pop()
stackTwo.description

// ==============================================

// MARK: - Balance the Parantheses using Stack
// h((e))llo(world)() -> 1
// (hello world -> 2
let balancedParantheses = "h((e))llo(world)()"
let unbalanced = "(hello world"
let string1Array = balancedParantheses.map { String($0) }
var stackThree = Stack(string1Array)

func isBalanced(for string: String) -> Bool {
    var stack = Stack<Character>()
    
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    return stack.isEmpty
}

isBalanced(for: balancedParantheses)
isBalanced(for: unbalanced)

// ================== isPrimeNumber =======================

func isPrime(number: Int) -> Bool {
    // Anything less than 1
    if number <= 1 {
        return false
    }
    
    // 1, 2, 3 = Prime
    if number <= 3 {
        return true
    }
    
    // Prime numbers = Divisible by 1 and itself
    // Opposite of Prime number is Composite
    // 2 is the only even prime number
    // 2 and 3 are the only consecutive prime numbers
    
    // Logic: Iterate from 1 to sqrt(n) to find all the factors of n
    // So from 1 to sqrt(n), we would find exactly one factpr, i.e., 1
    // If does have more than one factor, it is not prime. i.e., number % i == 0
    var i = 2
    while i * i <= number { // 4 <= 5
        if number % i == 0 { // 5 * 4 != 0
            return false
        }
        
        i = i + 2 // 4 = 2 + 2
    }
    
    return true
}

isPrime(number: 5)
isPrime(number: 566)
