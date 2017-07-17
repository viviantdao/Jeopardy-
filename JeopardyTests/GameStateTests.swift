//
//  GameStateTests.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/10/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import XCTest
@testable import Jeopardy

class GameStateTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitializer() {
        let gameState = GameState(teams: [Team(name: "team1")], currentQuestion: nil)
        
        XCTAssertFalse(gameState.gameOver)
        XCTAssertFalse(gameState.pickNewQuestion)
        XCTAssertNil(gameState.currentQuestion)
        XCTAssertEqual(gameState.teams.count, 1)
        XCTAssertEqual(gameState.teams[0].name, "team1")
    }
}
