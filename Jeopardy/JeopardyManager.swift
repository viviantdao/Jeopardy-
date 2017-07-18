//
//  JeopardyManager.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/10/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation

class JeopardyManager {
    
    private(set) var questionRetriever: IRetrieveQuestions
    private(set) var gameState: GameState
    private var newTeamAddedHandler: (([Team])->Void)?
    
    init(path:String) {
        self.questionRetriever = QuestionRetriever(path: path)
        self.gameState = GameState(currentQuestion: nil, gameOver: false, pickNewQuestion: true)
    }
    
    func startQuestionWithCategory(_ category:String, index:Int) {
        
    }
    
    func questionAnswered(_ answeredCorrectly:Bool) {
        
    }
    
    func AddNewTeam(name:String){
        
        self.gameState.AddTeam(team: Team(name: name))
        self.newTeamAddedHandler?(self.gameState.teams)
        
    }
    
    func RegisterNewTeamAddedHandler(callback: @escaping ([Team])->Void){
        
        self.newTeamAddedHandler = callback
        
    }
}
