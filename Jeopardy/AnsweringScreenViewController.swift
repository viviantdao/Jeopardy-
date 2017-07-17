//
//  AnsweringScreenViewController.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/11/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit

class AnsweringScreenViewController: UIViewController {

    @IBOutlet weak var TimeRemaining: UILabel!
    
    @IBOutlet weak var correctButton: UIButton!
    
    @IBOutlet weak var incorrectButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var team2Label: UILabel!
    
    @IBOutlet weak var team1Label: UILabel!
    
    @IBOutlet weak var team3Label: UILabel!
    
    @IBOutlet weak var team4Label: UILabel!
    
    var fullTime: Int = 60
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
