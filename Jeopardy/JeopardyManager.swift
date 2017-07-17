//
//  JeopardyManager.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/10/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation

class JeopardyManager {
    fileprivate(set) var qr:QuestionRetriever
    fileprivate(set) var gameState: GameState
    
    init(teams:[Team], path:String) {
        self.qr = QuestionRetriever(path: path)
        self.gameState = GameState(teams: teams, currentQuestion: nil, gameOver: false, pickNewQuestion: true)
    }
    
    func startQuestionWithCategory(_ category:String, index:Int) {
    }
    
    func questionAnswered(_ answeredCorrectly:Bool) {
    }
}
