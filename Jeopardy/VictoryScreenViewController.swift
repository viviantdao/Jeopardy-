//
//  VictoryScreenViewController.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/11/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit

class VictoryScreenViewController: UIViewController {
    
    @IBOutlet weak var winnerAnnounced: UILabel!
    
    @IBOutlet weak var winnerScore: UILabel!
    
    @IBOutlet weak var secondPlace: UILabel!
    
    @IBOutlet weak var thirdPlace: UILabel!
    
    @IBOutlet weak var fourthPlace: UILabel!
//    

    var teamInfo:[Team] = []
    var sortedTeams:[Team] = []

    
    override func viewWillAppear(_ animated: Bool) {
        highScore()
        otherPlaces()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func highScore(){
//  array of teams structs
//  take into account all scores, order highest to low in array
//  array in order of highest to lowest
//  var winningTeam = array[0]
//  winnerAnnounced.text =   "You Rock,: \((winningTeam))"
//    winnerScore.text = "You scored
       
        // delete later!
        var team1:Team = Team(name: "t1")
        team1.score = 150
        teamInfo.append(team1)
        
        var team2:Team = Team(name: "t2")
        team2.score = 10
        teamInfo.append(team2)
        
        var team3:Team = Team(name: "t3")
        team3.score = 100
        teamInfo.append(team3)
        
        var team4:Team = Team(name: "t4")
        team4.score = 300
        teamInfo.append(team4)
        // end delete!
        
        
        
        sortedTeams = teamInfo.sorted(by: { $0.score > $1.score })
        winnerAnnounced.text =   "The Winner is: \((sortedTeams[0].name))!"
        winnerScore.text = "You Scored \((sortedTeams[0].score))"
    }
    
    func otherPlaces(){
        secondPlace.text = "Second place goes to: \((sortedTeams[1].name))"
        
        thirdPlace.text = "Third place goes to: \((sortedTeams[2].name))"
        
        fourthPlace.text = "Fourth place goes to: \((sortedTeams[3].name))"
        
    }
    

//    switch case?

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
