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
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var team2Label: UILabel!
    
    @IBOutlet weak var team1Label: UILabel!
    
    @IBOutlet weak var team3Label: UILabel!
    
    @IBOutlet weak var team4Label: UILabel!
    
    @IBOutlet weak var popUpLabel: UILabel!
    
    @IBOutlet weak var wrongGIF: UIImageView!
    
    @IBOutlet weak var visualTime: UIProgressView!
    
    let question = AppDelegate.Manager.GetCurrentQuestion()
    var countDownTimer: Timer?
    var animationTimer: Timer?
    var animationDuration = 1.0

    var timeRemainingInSeconds = 0
    
    var teams : [Team] = AppDelegate.Manager.gameState.teams
    var startTeamIndex = AppDelegate.Manager.gameState.currentTeamIndex
    
    var questionCount: Int = 0
    var timeDivide = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


    }
    
    override func viewWillAppear(_ animated: Bool) {
        popUpLabel.layer.backgroundColor = UIColor.white.cgColor
        popUpLabel.layer.cornerRadius = 10;
        questionLabel.text = question.text
        timeRemainingInSeconds = question.time
       
        setLabels()
        startQuestion()
        
    }

    func startQuestion() {
        popUpLabel.isHidden = true
        animationDuration = 1.0
        teams[AppDelegate.Manager.gameState.currentTeamIndex].canAnswer = true

        for group in teams {
            if group.canAnswer {
                teamHighLight(team: group)
                popUpLabel.text = " Please indicate if \(group.name) answered correctly "
            }
        }
        
        timeDivide = 1
        
        if questionCount != 0 {
            for _ in 1...questionCount {
                timeDivide *= 2
            }
        }
        
        if questionCount == 4 {
            timeRemainingInSeconds = 0
            self.dismiss(animated: true) {
            }
        } else {
            self.timeRemainingInSeconds = question.time / timeDivide
        }
        
        self.TimeRemainingLabel.textColor = .white
        self.TimeRemainingLabel.text = "\(timeRemainingInSeconds) seconds remaining"
        
//        self.view.backgroundColor = .blue



        self.countDownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(AnsweringScreenViewController.countdownTimerFired), userInfo: nil, repeats: true)
        
        print(teams[0].canAnswer)
        print(teams[1].canAnswer)

        print(teams[2].canAnswer)

        print(teams[3].canAnswer)

        

    }
    
    func teamHighLight(team: Team) {
        switch team.name {
        case teams[0].name:
            team1Label.textColor = .white
            
            
            team2Label.textColor = .black
            
            team3Label.textColor = .black
            
            team4Label.textColor = .black
        case teams[1].name:
            team2Label.textColor = .white
            team1Label.textColor = .black
            
            team3Label.textColor = .black
            
            team4Label.textColor = .black
        case teams[2].name:
            team3Label.textColor = .white
            team1Label.textColor = .black
            
            team2Label.textColor = .black

            
            team4Label.textColor = .black
        case teams[3].name:
            team4Label.textColor = .white
            team1Label.textColor = .black
            
            team2Label.textColor = .black
            
            team3Label.textColor = .black

        default:
            break
        }
        //HighLights which team is answering currently
    }

    
    @IBAction func correctPressed(_ sender: Any) {
        AppDelegate.Manager.questionAnswered(true)
        AppDelegate.Manager.gameState.currentTeamIndex = (self.startTeamIndex + 1) % 4
        //let destination = UIStoryboard(name: "GameScreen", bundle: nil).instantiateInitialViewController() as! GameScreenViewController
        //destination.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        //self.present(destination, animated: true, completion: nil)
        self.dismiss(animated: true) {
        }
    }
    
    
    
    @IBAction func incorrectPressed(_ sender: Any) {
        self.animationTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(AnsweringScreenViewController.animateTimer), userInfo: nil, repeats: true)

        AppDelegate.Manager.gameState.currentTeamIndex = (AppDelegate.Manager.gameState.currentTeamIndex + 1 )%4
        wrongGIF.isHidden = false
        wrongGIF.loadGif(name: "Wrong")

        questionCount += 1
        self.countDownTimer?.invalidate()
        self.countDownTimer = nil
        startQuestion()
    }

    
    func animateTimer() {
        animationDuration -= 1.0
        if animationDuration <= 0 {
            self.animationTimer?.invalidate()
            self.animationTimer = nil
            wrongGIF.isHidden = true
        }
        
    }
    
    func setLabels() {
//        questionLabel.text = ""
        team1Label.text = "\(teams[0].name): \(teams[0].score)"
        team2Label.text = "\(teams[1].name): \(teams[1].score)"
        team3Label.text = "\(teams[2].name): \(teams[2].score)"
        team4Label.text = "\(teams[3].name): \(teams[3].score)"
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
            //if questionCount == 4 {
                popUpLabel.isHidden = false
           // }
            //questionLabel.isHidden = true
        }
        
    }
    
    func updateTimeRemaining() {
        self.TimeRemainingLabel.text = "\(timeRemainingInSeconds) seconds remaining"
        if (self.timeRemainingInSeconds <= 5) {
            self.TimeRemainingLabel.textColor = .red
        }
        else if (self.timeRemainingInSeconds <= 10) {
            self.TimeRemainingLabel.textColor = .orange
        }
        else if (self.timeRemainingInSeconds <= 15) {
            self.TimeRemainingLabel.textColor = .yellow
        }
        else if (self.timeRemainingInSeconds <= 30){
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
