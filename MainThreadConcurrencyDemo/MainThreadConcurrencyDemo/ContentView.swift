//
//  ContentView.swift
//  MainThreadConcurrencyDemo
//
//  Created by My3 Shenoy on 1/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var calculationDisabled = false
    
    let operation = CalculatePrimeOperation()
    var body: some View {
        VStack {
            Spacer()
            DatePicker(selection: .constant(Date()), label: { Text("Date") })
                .labelsHidden()
            Button(action: {
                calculatePrimes()
            }) {
                Text("Calculate Primes")
            }
            .disabled(calculationDisabled)
            
            Spacer()
        }
    }
    
    /// let mainThreadOperationQueueExample = OperationQueue.main
    func calculatePrimes() {
        // GCD
        // qos: Quality of service
        // .userInitiated: You might use this quality-of-service class to load the content of an email that you want to display to the user.
        calculationDisabled = true
        DispatchQueue.global(qos: .userInitiated).async {
            for number in 0...1_000_000 {
                let isPrimeNumber = self.isPrime(number: number)
                print("\(number) is a prime: \(isPrimeNumber)")
            }
            calculationDisabled = false
        }
        
// Commented code to do the operation using OperationQueue
//        let queue  =  OperationQueue()
//        queue.addOperation {
//            for number in 0...1_000_000 {
//                let isPrimeNumber = self.isPrime(number: number)
//                print("\(number) is a prime: \(isPrimeNumber)")
//            }
//        }
    }
    
    func isPrime(number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        
        if number <= 3 {
            return true
        }
        
        var i = 2
        while i * i <= number {
            if number % i == 0 {
                return false
            }
            
            i = i + 2
        }
        
        return true
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
