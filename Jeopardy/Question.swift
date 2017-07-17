//
//  Question.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/10/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import Foundation

public struct Question {
    public fileprivate(set) var text: String
    public fileprivate(set) var time: Int
    public fileprivate(set) var category: String
    public fileprivate(set) var pointValue: Int
    
    public var hasBeenAsked:Bool = false
    
    init (text:String, time:Int, pointValue:Int, category:String) {
        self.text = text
        self.time = time
        self.pointValue = pointValue
        self.category = category
    }
}
