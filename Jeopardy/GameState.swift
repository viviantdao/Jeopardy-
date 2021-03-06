//
//  GameState.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/10/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import Foundation

public struct GameState {
    
    public var teams:[Team] = []
    public var currentQuestion:Question? = nil
    public fileprivate(set) var gameOver:Bool = false
    public fileprivate(set) var pickNewQuestion:Bool = false
<<<<<<< HEAD
    public var currentTeamIndex:Int = 0
=======
    public  var currentTeamIndex = 0
>>>>>>> aa8cb7eb555d719a0eedcd277ad7420b8e4b9a0e
    
    init (teams:[Team], currentQuestion:Question?, gameOver:Bool = false, pickNewQuestion:Bool = false) {
        self.teams = teams
        self.currentQuestion = currentQuestion
        self.gameOver = gameOver
        self.pickNewQuestion = pickNewQuestion
    }
    
    init(currentQuestion:Question?, gameOver:Bool = false, pickNewQuestion:Bool = false){
        self.currentQuestion = currentQuestion
        self.gameOver = gameOver
        self.pickNewQuestion = pickNewQuestion
    }
    
    var currentTeam: Team {
        get {
            return self.teams[self.currentTeamIndex]
        }
    }
    
    func StartNewGame(teams: [Team]? = nil)->GameState{
        
        return GameState(teams: teams ?? self.teams,
                         currentQuestion: nil,
                         gameOver: false,
                         pickNewQuestion: false)
    }
    
    mutating func AddTeam(team: Team)->Void{
        self.teams.append(team)
    }
    
    mutating func AddTeams(teams: [Team])->Void{
        
        self.teams += teams
        
    }
    
    mutating func SetCurrentQuestion(question:Question)->Void {
        
        self.currentQuestion = question
        
    }
    
    
}
