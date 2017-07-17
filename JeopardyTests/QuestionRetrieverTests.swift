//
//  QuestionRetrieverTests.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/10/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import XCTest
@testable import Jeopardy

class QuestionRetrieverTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitializeCategories() {
        let testBundle = Bundle(for: QuestionRetrieverTests.self)
        let path = testBundle.path(forResource: "TestQuestionData", ofType: "plist")
        let qr = QuestionRetriever(path: path!)
        
        XCTAssertEqual(qr.categories.count, 2)
        
        if (qr.categories.count == 2) {
            XCTAssertEqual(qr.categories[0], "Category1")
            XCTAssertEqual(qr.categories[1], "Category0")
        }
    }
    
    func testInitializeQuestions() {
        let testBundle = Bundle(for: QuestionRetrieverTests.self)
        let path = testBundle.path(forResource: "TestQuestionData", ofType: "plist")
        let qr = QuestionRetriever(path: path!)
        
        XCTAssertEqual(qr.countOfQuestions, 4)
    }
    
    func testQuestionForCategory() {
        let testBundle = Bundle(for: QuestionRetrieverTests.self)
        let path = testBundle.path(forResource: "TestQuestionData", ofType: "plist")
        let qr = QuestionRetriever(path: path!)
        
        XCTAssertEqual(qr.countOfQuestions, 4)

        if (qr.countOfQuestions == 4) {
            self.verifyQuestion(qr.questionForCategory("Category0", index: 0),
                                actual: Question(text: "Question0 in Category0", time: 60, pointValue: 100, category: "Category0"))
            self.verifyQuestion(qr.questionForCategory("Category0", index: 1),
                                actual: Question(text: "Question1 in Category0", time: 120, pointValue: 200, category: "Category0"))
            self.verifyQuestion(qr.questionForCategory("Category1", index: 0),
                                actual: Question(text: "Question0 in Category1", time: 60, pointValue: 100, category: "Category1"))
            self.verifyQuestion(qr.questionForCategory("Category1", index: 1),
                                actual: Question(text: "Question1 in Category1", time: 120, pointValue: 200, category: "Category1"))
        }
    }
    
    func testQuestionForCategoryMarkedAsAsked() {
        let testBundle = Bundle(for: QuestionRetrieverTests.self)
        let path = testBundle.path(forResource: "TestQuestionData", ofType: "plist")
        let qr = QuestionRetriever(path: path!)
        
        XCTAssertEqual(qr.countOfQuestions, 4)
        
        if (qr.countOfQuestions == 4) {
            var question = Question(text: "Question0 in Category0", time: 60, pointValue: 100, category: "Category0")
            question.hasBeenAsked = true
            
            self.verifyQuestion(question,
                                actual: qr.questionForCategory("Category0", index: 0, markAsAsked: true))
            self.verifyQuestion(Question(text: "Question1 in Category0", time: 120, pointValue: 200, category: "Category0"),
                                actual: qr.questionForCategory("Category0", index: 1))
            self.verifyQuestion(Question(text: "Question0 in Category1", time: 60, pointValue: 100, category: "Category1"),
                                actual: qr.questionForCategory("Category1", index: 0))
            self.verifyQuestion(Question(text: "Question1 in Category1", time: 120, pointValue: 200, category: "Category1"),
                                actual: qr.questionForCategory("Category1", index: 1))
        }
    }
    
    fileprivate func verifyQuestion(_ expected:Question, actual:Question) {
        XCTAssertEqual(expected.category, actual.category)
        XCTAssertEqual(expected.hasBeenAsked, actual.hasBeenAsked)
        XCTAssertEqual(expected.pointValue, actual.pointValue)
        XCTAssertEqual(expected.text, actual.text)
        XCTAssertEqual(expected.time, actual.time)
    }
}
