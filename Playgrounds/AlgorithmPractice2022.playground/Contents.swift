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

