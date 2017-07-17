//
//  QuestionRetriever.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/10/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation

class QuestionRetriever {
    fileprivate(set) var countOfQuestions: Int = 0
    fileprivate(set) var categories: [String] = []
    
    init(path: String) {
    }
    
    func questionForCategory(_ category:String, index:Int, markAsAsked:Bool = false) -> Question {
        return Question(text: "question", time: 0, pointValue: 0, category: "category")
    }
}
