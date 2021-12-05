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
        100 - abs(target - sliderValue)
    }
}
