//
//  AnsweringScreenViewController.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/11/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit
import QuartzCore

class AnsweringScreenViewController: UIViewController {

    @IBOutlet weak var TimeRemainingLabel: UILabel!
    
    @IBOutlet weak var correctButton: UIButton!
    
    @IBOutlet weak var incorrectButton: UIButton!
    
    
    
    @IBOutlet weak var team2Label: UILabel!
    
    @IBOutlet weak var team1Label: UILabel!
    
    @IBOutlet weak var team3Label: UILabel!
    
    @IBOutlet weak var team4Label: UILabel!
    
    @IBOutlet weak var popUpLabel: UILabel!
    
    var countDownTimer: Timer?
    var fullTime = 10
    var timeRemainingInSeconds = 10
    
    var group1 = Team(name: "Team COJO")
    var group2 = Team(name: "Team X")
    var group3 = Team(name: "Team Echo the Question")
    var group4 = Team(name: "Team KKM")
    
    var teams : [Team] = []
    
    var numberQuestionAsked: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        popUpLabel.layer.backgroundColor = UIColor.white.cgColor
        popUpLabel.layer.cornerRadius = 10;
//        popUpLabel.textColor = .black
        group1.score = 2200
        group2.score = 1500
        group3.score = 1750
        group4.score = 2050
        
        teams.append(group1)
        teams.append(group2)
        teams.append(group3)
        teams.append(group4)

        teams[2].canAnswer = true
        setLabels()
        startQuestion()
        
//        for group in teams {
//            if group.canAnswer {
//                teamHighLight(team: group)
//            }
//        }
//        
//        self.TimeRemainingLabel.textColor = .white
//        self.TimeRemainingLabel.text = "\(self.timeRemainingInSeconds) seconds remaining"
//        
//
//        
//        self.timeRemainingInSeconds = fullTime / (numberQuestionAsked * 2)
//        self.countDownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(AnsweringScreenViewController.countdownTimerFired), userInfo: nil, repeats: true)
    }

    func startQuestion() {
        popUpLabel.isHidden = true
        
        for group in teams {
            if group.canAnswer {
                teamHighLight(team: group)
                popUpLabel.text = " Please indicate if \(group.name) answered correctly "
            }
        }
        var timeDivide = numberQuestionAsked * 2
        if timeDivide == 0 {
            timeDivide = 1
        }
        self.timeRemainingInSeconds = fullTime / timeDivide
        self.TimeRemainingLabel.textColor = .white
        self.TimeRemainingLabel.text = "\(timeRemainingInSeconds) seconds remaining"
        
//        self.view.backgroundColor = .blue



        self.countDownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(AnsweringScreenViewController.countdownTimerFired), userInfo: nil, repeats: true)
    }
    
    func teamHighLight(team: Team) {
        switch team.name {
        case group1.name:
            team1Label.textColor = .white
        case group2.name:
            team2Label.textColor = .white
        case group3.name:
            team3Label.textColor = .white
        case group4.name:
            team4Label.textColor = .white
        default:
            break
        }
        //HighLights which team is answering currently
    }
    
    @IBAction func correctPressed(_ sender: Any) {
        //performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
    }
    
    @IBAction func incorrectPressed(_ sender: Any) {
        numberQuestionAsked += 1
        self.countDownTimer?.invalidate()
        self.countDownTimer = nil
        startQuestion()
    }
    
    
    func setLabels() {
//        questionLabel.text = ""
        team1Label.text = "\(teams[0].name): \(teams[0].score)"
        team2Label.text = "\(teams[1].name): \(teams[1].score)"
        team3Label.text = "\(teams[2].name): \(teams[2].score)"
        team4Label.text = "\(teams[3].name): \(teams[3].score)"
    }
    
    func evaluateStatus() {
        //Correct or Incorrect?
        //  -if Correct: Reward the team the points and segue back to the GameScreen
        //  -if Incorrect: Divide the time remaining by two and continue the game with next team
        //      -if no one is right segue to next screen without adding points
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func countdownTimerFired() {
        self.timeRemainingInSeconds -= 1
        self.updateTimeRemaining()
        
        if (self.timeRemainingInSeconds <= 0) {
            self.countDownTimer?.invalidate()
            self.countDownTimer = nil
            self.TimeRemainingLabel.text = "Time is up"
            popUpLabel.isHidden = false
        }
        
    }
    
    func updateTimeRemaining() {
        self.TimeRemainingLabel.text = "\(timeRemainingInSeconds) seconds remaining"
        if (self.timeRemainingInSeconds <= Int(timeRemainingInSeconds / 6)) {
            self.TimeRemainingLabel.textColor = .red
        }
        else if (self.timeRemainingInSeconds <= Int(timeRemainingInSeconds / 3)) {
            self.TimeRemainingLabel.textColor = .orange
        }
        else if (self.timeRemainingInSeconds <= Int(timeRemainingInSeconds / 2)) {
            self.TimeRemainingLabel.textColor = .yellow
        }
        else if (self.timeRemainingInSeconds <= Int(timeRemainingInSeconds * 3 / 4)){
            self.TimeRemainingLabel.textColor = .green
        }
        else {
            self.TimeRemainingLabel.textColor = .white
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
