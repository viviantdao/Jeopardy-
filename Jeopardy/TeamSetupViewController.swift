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
    @IBOutlet weak var teamTable: UITableView!
    @IBOutlet weak var startGame: UIButton!
    
    @IBAction func addTeamName(_ sender: Any) {
        jeopardy.AddNewTeam(name: (enterTeamName?.text)!)
        self.enterTeamName?.text = ""
    }
    
   
    @IBAction func startButtonPressed(_ sender: Any) {
    let destination = UIStoryboard(name: "AnsweringScreenViewController", bundle: nil).instantiateInitialViewController() as! AnsweringScreenViewController
        destination.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        jeopardy.startNewGame()
        self.present(destination, animated: true, completion: nil)

    }
 

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(_ tableViewL: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TeamCell = self.teamTable.dequeueReusableCell(withIdentifier:"teamNameCell", for: indexPath) as! TeamCell
        cell.teamName.text = self.names[indexPath.row]
        return cell
    
    }
 
    
    override func viewWillAppear(_ animated: Bool) {
        jeopardy.RegisterNewTeamAddedHandler( callback: {teams in
            self.names = teams
            self.teamTable.reloadData()
            if self.names.count >= 4 {
                self.startGame.isEnabled = true
            }
            else {
                self.startGame.isEnabled = false
            }
            
            

        })
    
        
        // first set up an object to animate
        // we'll use a familiar red square
        let square = UIView()
        square.frame = CGRect(x: 55, y: 300, width: 20, height: 20)
        square.backgroundColor = UIColor.white
        
        // add the square to the screen
       self.view.addSubview(square)
        //let square = UIView()
        self.view.addSubview(square)
        
        // now create a bezier path that defines our curve
        // the animation function needs the curve defined as a CGPath
        // but these are more difficult to work with, so instead
        // we'll create a UIBezierPath, and then create a
        // CGPath from the bezier when we need it
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 16,y: 500))
        path.addCurve(to: CGPoint(x: 301, y: 239), controlPoint1: CGPoint(x: 136, y: 373), controlPoint2: CGPoint(x: 178, y: 110))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.cgPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 10.0
        
        // we add the animation to the squares 'layer' property
        square.layer.add(anim, forKey: "animate position along path")
        
        for _ in 0...5 {
            
            // create a square
            let square = UIView()
            square.frame = CGRect(x: 55, y: 300, width: 20, height: 20)
            square.backgroundColor = UIColor.white
            self.view.addSubview(square)
            
            // randomly create a value between 0.0 and 150.0
            let randomYOffset = CGFloat( arc4random_uniform(500))
            
            // for every y-value on the bezier curve
            // add our random y offset so that each individual animation
            // will appear at a different y-position
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 16,y: 239 + randomYOffset))
            path.addCurve(to: CGPoint(x: 301, y: 239 + randomYOffset), controlPoint1: CGPoint(x: 136, y: 373 + randomYOffset), controlPoint2: CGPoint(x: 500, y: 110 + randomYOffset))
            
            // create the animation
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.cgPath
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
            anim.duration = 8.0
            
            // add the animation 
            square.layer.add(anim, forKey: "animate position along path")
        }
        // ==================================== randomly dispersed squares ==============================
        // each square will take between 4.0 and 8.0 seconds
        // to complete one animation loop
        anim.duration = Double(arc4random_uniform(40)+30) / 10
        
        // stagger each animation by a random value
        // `290` was chosen simply by experimentation
        anim.timeOffset = Double(arc4random_uniform(290))
        
        for _ in 0...6 {
            
            // create a square
            let square = UIView()
            square.frame = CGRect(x: 55, y: 300, width: 20, height: 20)
            square.backgroundColor = UIColor.white
            self.view.addSubview(square)
            
            // randomly create a value between 0.0 and 150.0
            let randomYOffset = CGFloat( arc4random_uniform(500))
            
            // for every y-value on the bezier curve
            // add our random y offset so that each individual animation
            // will appear at a different y-position
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 1500,y: 239 + randomYOffset))
            path.addCurve(to: CGPoint(x: 301, y: 239 + randomYOffset), controlPoint1: CGPoint(x: 170, y: 373 + randomYOffset), controlPoint2: CGPoint(x: 500, y: 110 + randomYOffset))
            
            // create the animation
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.cgPath
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
            anim.duration = 10.0
            
            // add the animation
            square.layer.add(anim, forKey: "animate position along path")
        }
        // ==================================== randomly dispersed squares ==============================
        // each square will take between 4.0 and 8.0 seconds
        // to complete one animation loop
        anim.duration = Double(arc4random_uniform(40)+30) / 10
        
        // stagger each animation by a random value
        // `290` was chosen simply by experimentation
        anim.timeOffset = Double(arc4random_uniform(290))
        
        
        
        
        
      
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "space")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
