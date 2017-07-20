//
//  QuestionsCollectionViewController.swift
//  Jeopardy
//
//  Created by Poonam Hattangady on 7/11/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"
private var count: Int = 0
private var questions: Int = 5
private var categories: Int = 5

private var screenX :Int = 950
private var screenY :Int = 580
private var insetRatio: Double = 0.012




class QuestionsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var pressed: [[Bool]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pressed = [[false,false,false,false,false],[false,false,false,false,false],[false,false,false,false,false],[false,false,false,false,false],
                        [false,false,false,false,false]]

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return categories
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return questions
    }
    
    //SET SIZES FOR CELLS based on category & question numbers
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (screenX/categories) - Int(Double(screenX)*insetRatio), height: ((screenY-(questions))/questions) - 15)
        
    }

    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as UICollectionViewCell
    
        count += 1
        
        // Configure the cell
        let label: UILabel = cell.viewWithTag(1) as! UILabel
        
        
        if(pressed[indexPath.section][indexPath.row]){
            label.text = ""
            
            UIView.animate(withDuration: 2, animations: { () -> Void in
                label.backgroundColor = .red })
        }else{
            label.text = String(100*(1+indexPath.row))
            
        }
        
        
        return cell
        
    }

    
    
    
    
    
    
    
    
    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    //Highlighted During tracking:
//    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//    
//
//    
//    // Uncomment this method to specify if the specified item should be selected
//    //Selected:
//    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let y = indexPath.row
        let x = indexPath.section
        
        print("[\(x), \(y)]")
        print(pressed[x][y])
        
        pressed[x][y] = true
        
        
        collectionView.reloadItems(at: [indexPath])
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if (pressed[indexPath.section][indexPath.row]) {
            return false
        } else {
            return true
        }
    }
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    
    /*
    
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}








