//
//  VictoryScreenViewController.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/11/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit
import AVFoundation

class VictoryScreenViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
   
    @IBOutlet weak var FireWork1: UIImageView!
    
    @IBOutlet weak var FireWork2: UIImageView!
    
    @IBOutlet weak var gifView: UIImageView!
    
    @IBOutlet weak var winnerAnnounced: UILabel!
    
    @IBOutlet weak var winnerScore: UILabel!
    
    @IBOutlet weak var secondPlace: UILabel!
    
    @IBOutlet weak var thirdPlace: UILabel!
    
    @IBOutlet weak var fourthPlace: UILabel!

    
   let manager = AppDelegate.Manager
//    var teamInfo:[Team] = []
    var sortedTeams:[Team] = []
    
   override func viewDidLoad() {
       super.viewDidLoad()
    
    do{
        let audioPath = Bundle.main.path(forResource: "Jeopardy Trap Remix", ofType: "mp3")
        
        try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
    }
    catch{
        
    }
    player.play()

    gifView.loadGif(name: "SpaceGif")
    
    FireWork1.loadGif(name: "fireworks")
    
    FireWork2.loadGif(name: "fireworks")
    
    
    }
    
    
    
//    
    
    
    override func viewWillAppear(_ animated: Bool) {
//         delete later!
//           createTestData()
//         end delete!
        
        let teams = manager.GetTeamResults()
        sortedTeams = teams.sorted(by: { $0.score > $1.score })
        highScore()
        otherPlaces()
        
    }
    
    func highScore(){
        winnerAnnounced.text =   "The Winner is: \((sortedTeams[0].name))!"
        winnerScore.text = "Score: \((sortedTeams[0].score))"
    }
    
    func otherPlaces(){
        secondPlace.text = "2nd: \((sortedTeams[1].name))"
        thirdPlace.text = "3rd: \((sortedTeams[2].name))"
        fourthPlace.text = "4th: \((sortedTeams[3].name))"
    }
    
//    func createTestData() {
//        var team1:Team = Team(name: "t1")
//        team1.score = 150
//        teamInfo.append(team1)
//        
//        var team2:Team = Team(name: "t2")
//        team2.score = 10
//        teamInfo.append(team2)
//        
//        var team3:Team = Team(name: "t3")
//        team3.score = 100
//        teamInfo.append(team3)
//        
//        var team4:Team = Team(name: "t4")
//        team4.score = 300
//        teamInfo.append(team4)
//    }
}
