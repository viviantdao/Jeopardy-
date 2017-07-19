//
//  TeamSetupViewController.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/11/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit

class TeamSetupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    var names: [String] = []
    var jeopardy = AppDelegate.Manager
    
    @IBOutlet weak var enterTeamName: UITextField!
    @IBOutlet weak var jeopardyTable: UITableViewCell!
    @IBOutlet weak var teamNames: UILabel!
    @IBOutlet weak var teamTable: UITableView!
    @IBOutlet weak var startGame: UIButton!
    
    @IBAction func addTeamName(_ sender: Any) {
        Manager.AddNewTeam(enterTeamName?.text)
            }
    
   
    
   
    @IBAction func startButtonPressed(_ sender: Any) {
    let destination = UIStoryboard(name: "GameScreenViewController", bundle: nil).instantiateInitialViewController() as! GameScreenViewController
        destination.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(destination, animated: true, completion: nil)

    }
 

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(_ tableViewL: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.teamTable.dequeueReusableCell(withIdentifier:"teamNameCell", for: indexPath)
    
   return cell
    
    }
 
    
    override func viewWillAppear(_ animated: Bool) {
        Manager.RegisterNewTeamAddedHandler( {teams in
            self.names = teams
            self.teamTable.reloadData()
            if self.names.count >= 4 {
                startGame.isEnabled = true
            }
            else {
                startGame.isEnabled = false
            }
            

        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
