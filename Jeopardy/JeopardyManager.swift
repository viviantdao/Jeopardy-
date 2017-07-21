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
    private var newTeamAddedHandler: (([String])->Void)?
    
    fileprivate init(path:String) {
        self.questionRetriever = QuestionRetriever(path: path)
        self.gameState = GameState(currentQuestion: nil, gameOver: false, pickNewQuestion: true)
    }
    
    func startNewGame()->Void{
        
        self.gameState = self.gameState.StartNewGame()
        
    }
    
    func getCategories()->[String] {
        
        return self.questionRetriever.categories
        
    }
    
    func getQuestionPerCategoryCount()->Int{
        
        return self.questionRetriever.countOfQuestionsPerCategory
        
    }
    
    func GetQuestionFromCategoryQuestionIndex(category: Int, Question:Int)->Question{
        
        var question = questionRetriever.questionForCategoryBasedOnBsIndexSystemNeedlesslyCouplingImplementations(x: category, y: Question)
        question.hasBeenAsked = true
        self.gameState.SetCurrentQuestion(question: question)
        return question
    }
    
    func startQuestionWithCategory(_ category:String, pointValue:Int) {
        
    }
    
    func questionAnswered(_ answeredCorrectly:Bool) {
        
    }
    
    func AddNewTeam(name:String){
        
        self.gameState.AddTeam(team: Team(name: name))
        self.newTeamAddedHandler?(self.gameState.teams.reduce([String](), { (names, team) -> [String] in
            names + [team.name]
        }))
        
    }
    
    func RegisterNewTeamAddedHandler(callback: @escaping ([String])->Void){
        
        self.newTeamAddedHandler = callback
        
    }
    
    func GetTeamNames()->[String]{
        
        return self.gameState.teams.reduce([String](), { (names, team) -> [String] in
            names + [team.name]})
        
    }
    
    func GetTeamResults()->[Team]{
        
        return self.gameState.teams
        
    }
    
    func GetCurrentQuestion()->Question {
        
        return self.gameState.currentQuestion!
        
    }
    
    func GetCurrentTeam()->Team{
        
        return self.gameState.currentTeam
    }
}

class JeopardyGameBuilder{
    
    private var pathDelegate: (()->String)?
    
    typealias BuilderClosure = (JeopardyGameBuilder)->()
    
    init(closure: BuilderClosure){
        closure(self)
    }
    
    func setPathDelegate(_ delegate: @escaping ()->String){
        
        self.pathDelegate = delegate
        
    }
    
    func build()->JeopardyManager{
        //TODO: Need to figure out error handling here
        return JeopardyManager(path: self.pathDelegate!())
        
    }
}
