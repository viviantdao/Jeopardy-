//
//  IRetrieveQuestions.swift
//  Jeopardy
//
//  Created by Young Tech on 7/17/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation

protocol IRetrieveQuestions{
    
    func questionForCategory(_ category:String, pointValue:Int, markAsAsked: Bool) -> Question
    
    func questionForCategoryBasedOnBsIndexSystemNeedlesslyCouplingImplementations(x:Int, y:Int)->Question
    
    var countOfQuestions: Int { get }
    
    var categories: [String] { get }
    
    var countOfQuestionsPerCategory:Int { get }
    
}
