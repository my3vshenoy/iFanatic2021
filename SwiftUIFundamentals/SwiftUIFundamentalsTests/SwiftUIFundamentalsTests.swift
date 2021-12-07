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
    
    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.currentRound, 2)
    }
    
    func testScoreExact() {
        let guess = game.target
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 200)
    }
    
    func testScoreAlmostExact() {
        let guess = game.target + 2
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 98 + 50)
    }
    
    func testRestartGame() {
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.currentRound, 1)
        
        game.restart()
        
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.currentRound, 1)
        
    }
}
