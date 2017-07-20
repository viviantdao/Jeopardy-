//
//  QuestionRetriever.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/10/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation

final class QuestionRetriever: IRetrieveQuestions {
    
    private var questions: [Question] = []
    private var numberOfQuestionsPerCategory:Int = 0
    
    init(path: String) {
        
        let questionDict = NSDictionary(contentsOfFile: path)
        
        for (_, key) in questionDict!{
            let categoryKey = key as! [String:Any]
            for question in categoryKey["Questions"] as! [[String:Any]]{
                questions.append(Question(text: question["text"] as! String,
                                          time: question["time"] as! Int,
                                          pointValue: question["pointValue"] as! Int,
                                          category: question["category"] as! String))
            }
        }
    }
    
    var countOfQuestions: Int {
        
        get { return self.questions.count }
        
    }
    
    var countOfQuestionsPerCategory:Int {
        
        get {
            
            if self.numberOfQuestionsPerCategory != 0{
                return self.numberOfQuestionsPerCategory
            }
            
            let category = self.categories[0]
            
            self.numberOfQuestionsPerCategory
                = self.questions.filter({ (question) -> Bool in
                    question.category == category
                }).count
            
            return self.numberOfQuestionsPerCategory
        }
    }
    
    var categories: [String] {
        
        get{
            
            return self.questions.reduce([String](), { (array, question) -> [String] in
                if(!array.contains(question.category)){
                    return array + [question.category]
                }
                return array
            })
        }
        
    }
    
    
    func questionForCategory(_ category:String, pointValue:Int, markAsAsked: Bool = false) -> Question {
        
        let questionResult = self.questions.filter { (question) -> Bool in
            return question.category == category && question.pointValue == pointValue
        }
        var question = questionResult[0]
        question.hasBeenAsked = markAsAsked
        return question
    }
}
