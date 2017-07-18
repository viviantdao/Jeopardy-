//
//  QuestionRetriever.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/10/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation

class QuestionRetriever: IRetrieveQuestions {
    
    private var questions: [Question] = []
    
    init(path: String) {
        
        let questionDict = NSArray(contentsOfFile: path)
        
        for questionArray in questionDict!{
            self.questions += questionArray as! [Question]
        }
        
    }
    
    var countOfQuestions: Int {
        
        get { return self.questions.count }
        
    }
    
    var categories: [String] {
        
        get{
            
            return self.questions.reduce([String](), { (array, question) -> [String] in
                array + [question.category]
            })
        }
        
    }
    
    
    func questionForCategory(_ category:String, index:Int, markAsAsked:Bool = false) -> Question {
        return Question(text: "question", time: 0, pointValue: 0, category: "category")
    }
}
