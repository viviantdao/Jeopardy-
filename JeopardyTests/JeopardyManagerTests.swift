////
////  JeopardyManagerTests.swift
////  Jeopardy
////
////  Created by Poonam Hattangady on 7/10/16.
////  Copyright © 2016 Microsoft. All rights reserved.
////
//
//import XCTest
//@testable import Jeopardy
//
//class JeopardyManagerTests: XCTestCase {
//
//    var jm: JeopardyManager? = nil
//    var teams: [Team] = []
//    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//        
//        let testBundle = Bundle(for: QuestionRetrieverTests.self)
//        let path = testBundle.path(forResource: "TestQuestionData", ofType: "plist")
//        
//        self.teams = [Team(name: "t1"), Team(name: "t2"), Team(name: "t3")]
//        self.jm = JeopardyManager(teams: self.teams, path: path!)
//        self.teams[0].canChooseQuestion = true
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    func testIntialize() {
//        XCTAssertEqual(self.jm!.qr.countOfQuestions, 4)
//        
//        let gameState = self.jm!.gameState
//        XCTAssertFalse(gameState.gameOver)
//        XCTAssertTrue(gameState.pickNewQuestion)
//    }
//    
//    func testPickQuestion() {
//        self.jm!.startQuestionWithCategory("Category0", index: 0)
//        let gameState = self.jm!.gameState
//        
//        self.teams[0].canAnswer = true
//        var question = self.jm!.qr.questionForCategory("Category0", index: 0)
//        question.hasBeenAsked = true
//        let expectedGameState = GameState(teams: self.teams, currentQuestion: question, gameOver: false, pickNewQuestion: false)
//        
//        self.verifyGameState(gameState, expected: expectedGameState)
//    }
//    
//    func testAnswerCorrectly() {
//        self.testPickQuestion()
//        
//        self.jm!.questionAnswered(true)
//        let gameState = self.jm!.gameState
//        
//        self.teams[0].canChooseQuestion = false
//        self.teams[0].score = 100
//        self.teams[1].canAnswer = false
//        self.teams[1].canChooseQuestion = true
//        
//        let expectedGameState = GameState(teams: self.teams, currentQuestion: nil, gameOver: false, pickNewQuestion: true)
//        self.verifyGameState(gameState, expected: expectedGameState)
//    }
//    
//    func testAnswerWrong() {
//        self.testPickQuestion()
//        self.testAnswerCorrectly()
//        
//        self.jm!.startQuestionWithCategory("Category0", index: 1)
//        var question = self.jm!.qr.questionForCategory("Category0", index: 1)
//        self.teams[0].canAnswer = false
//        question.hasBeenAsked = true
//        self.teams[1].canAnswer = true
//        
//        self.verifyGameState(self.jm!.gameState, expected: GameState(teams: self.teams, currentQuestion: question))
//        
//        self.jm!.questionAnswered(false)
//        self.teams[1].canAnswer = false
//        self.teams[2].canAnswer = true
//        self.verifyGameState(self.jm!.gameState, expected: GameState(teams: self.teams, currentQuestion: question))
//    }
//    
//    func testNoOneAnswersCorrectly() {
//        self.testAnswerWrong()
//        let question = self.jm!.qr.questionForCategory("Category0", index: 1)
//        
//        self.jm!.questionAnswered(false)
//        self.teams[2].canAnswer = false
//        self.teams[0].canAnswer = true
//        self.verifyGameState(self.jm!.gameState, expected: GameState(teams: self.teams, currentQuestion: question))
//        
//        self.jm!.questionAnswered(false)
//        self.teams[1].canChooseQuestion = false
//        self.teams[2].canChooseQuestion = true
//        self.verifyGameState(self.jm!.gameState, expected: GameState(teams: self.teams, currentQuestion: nil, gameOver: false, pickNewQuestion: true))
//    }
//    
//    func testGameOver() {
//        self.testNoOneAnswersCorrectly()
//        
//        // Two more questions remain to be answered. 
//        
//        // Team2 picks and answers this one.
//        self.jm!.startQuestionWithCategory("Category1", index: 0)
//        self.jm!.questionAnswered(true)
//        self.teams[2].score += 100
//        
//        self.jm!.startQuestionWithCategory("Category1", index: 1)
//        self.jm!.questionAnswered(true)
//        self.teams[0].score += 200
//        
//        let gameState = self.jm!.gameState
//        XCTAssertTrue(gameState.gameOver)
//        
//        XCTAssertEqual(gameState.teams[0].score, 300)
//        XCTAssertEqual(gameState.teams[1].score, 0)
//        XCTAssertEqual(gameState.teams[2].score, 100)
//    }
//    
//    fileprivate func verifyGameState(_ actual:GameState, expected:GameState) {
//        self.verifyTeam(actual.teams[0], expected: expected.teams[0])
//        self.verifyTeam(actual.teams[1], expected: expected.teams[1])
//        self.verifyTeam(actual.teams[2], expected: expected.teams[2])
//        
//        if (expected.currentQuestion != nil) {
//            self.verifyQuestion(actual.currentQuestion!, expected: expected.currentQuestion!)
//        } else {
//            XCTAssertNil(actual.currentQuestion)
//        }
//        
//        XCTAssertEqual(actual.gameOver, expected.gameOver)
//        XCTAssertEqual(actual.pickNewQuestion, expected.pickNewQuestion)
//    }
//    
//    fileprivate func verifyTeam(_ actual: Team, expected: Team) {
//        XCTAssertEqual(actual.canAnswer, expected.canAnswer)
//        XCTAssertEqual(actual.canChooseQuestion, expected.canChooseQuestion)
//        XCTAssertEqual(actual.score, expected.score)
//        XCTAssertEqual(actual.name, expected.name)
//    }
//    
//    fileprivate func verifyQuestion(_ actual:Question, expected:Question) {
//        XCTAssertEqual(actual.category, expected.category)
//        XCTAssertEqual(actual.hasBeenAsked, expected.hasBeenAsked)
//        XCTAssertEqual(actual.pointValue, expected.pointValue)
//        XCTAssertEqual(actual.text, expected.text)
//        XCTAssertEqual(actual.time, expected.time)
//    }
//}
