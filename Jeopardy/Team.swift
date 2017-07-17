//
//  Team.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/10/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import Foundation

public struct Team {
    
    public fileprivate(set) var name: String
    
    public var score = 0
    public var canChooseQuestion = false
    public var canAnswer = false
    
    init (name:String) {
        self.name = name
    }
}
