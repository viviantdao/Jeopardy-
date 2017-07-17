//
//  GameState.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/10/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import Foundation

public struct GameState {
    public fileprivate(set) var teams:[Team] = []
    public fileprivate(set) var currentQuestion:Question? = nil
    public fileprivate(set) var gameOver:Bool = false
    public fileprivate(set) var pickNewQuestion:Bool = false
    
    init (teams:[Team], currentQuestion:Question?, gameOver:Bool = false, pickNewQuestion:Bool = false) {
        self.teams = teams
        self.currentQuestion = currentQuestion
        self.gameOver = gameOver
        self.pickNewQuestion = pickNewQuestion
    }
}
