//
//  ContentView.swift
//  MainThreadConcurrencyDemo
//
//  Created by My3 Shenoy on 1/8/22.
//

import SwiftUI

struct ContentView: View {
    
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
            
            Spacer()
        }
    }
    
    /// let mainThreadOperationQueueExample = OperationQueue.main
    func calculatePrimes() {
        let queue  =  OperationQueue()
        queue.addOperation {
            for number in 0...1_000_000 {
                let isPrimeNumber = self.isPrime(number: number)
                print("\(number) is a prime: \(isPrimeNumber)")
            }
        }
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
