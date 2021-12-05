//
//  SwiftUIFundamentalsTests.swift
//  SwiftUIFundamentalsTests
//
//  Created by My3 Shenoy on 12/4/21.
//

import XCTest
@testable import SwiftUIFundamentals

class SwiftUIFundamentalsTests: XCTestCase {

    private var game: GameLogic!
    
    override func setUpWithError() throws {
        game = GameLogic()
    }

    override func tearDownWithError() throws {
        game = nil
    }
    
    func testScoreGreaterThanSlider() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 95)
    }
    
    func testScoreLessThanSlider() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 95)
    }
}
