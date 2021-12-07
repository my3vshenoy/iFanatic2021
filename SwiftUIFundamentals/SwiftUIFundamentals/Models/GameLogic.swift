//
//  GameLogic.swift
//  SwiftUIFundamentals
//
//  Created by My3 Shenoy on 12/3/21.
//

import Foundation

struct GameLogic {
    var target = Int.random(in: 1...100)
    var score = 0
    var currentRound = 1
    
    func points(sliderValue: Int) -> Int {
        var bonus = 0
        switch sliderValue {
        case target:
            bonus = 100
        case target + 2, target - 2:
            bonus = 50
        default:
            break
        }
        
        return 100 - abs(target - sliderValue) + bonus
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        currentRound += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        target = Int.random(in: 1...100)
        score = 0
        currentRound = 1
    }
}
