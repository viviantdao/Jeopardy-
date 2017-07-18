//
//  AnsweringScreenViewController.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/11/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit

class AnsweringScreenViewController: UIViewController {

    @IBOutlet weak var TimeRemainingLabel: UILabel!
    
    @IBOutlet weak var correctButton: UIButton!
    
    @IBOutlet weak var incorrectButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var team2Label: UILabel!
    
    @IBOutlet weak var team1Label: UILabel!
    
    @IBOutlet weak var team3Label: UILabel!
    
    @IBOutlet weak var team4Label: UILabel!
    
    var countDownTimer: Timer?
    var timeRemainingInSeconds:Int = 60

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.TimeRemainingLabel.textColor = .white
        self.view.backgroundColor = .blue
        self.timeRemainingInSeconds = 60
        self.countDownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(AnsweringScreenViewController.countdownTimerFired), userInfo: nil, repeats: true)
    }

    func countdownTimerFired() {
        self.timeRemainingInSeconds -= 1
        self.updateTimeRemaining()
        
        if (self.timeRemainingInSeconds == 0) {
            self.countDownTimer?.invalidate()
            self.countDownTimer = nil
            self.TimeRemainingLabel.text = "Time is up"
        }
        
    }
    
    func updateTimeRemaining() {
        self.TimeRemainingLabel.text = "\(self.timeRemainingInSeconds) seconds remaining"
        if (self.timeRemainingInSeconds <= 10) {
            self.TimeRemainingLabel.textColor = .red
        }
        else if (self.timeRemainingInSeconds <= 20) {
            self.TimeRemainingLabel.textColor = .orange
        }
        else if (self.timeRemainingInSeconds <= 30) {
            self.TimeRemainingLabel.textColor = .yellow
        }
        else if (self.timeRemainingInSeconds <= 45){
            self.TimeRemainingLabel.textColor = .green
        }
        else {
            self.TimeRemainingLabel.textColor = .white
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
