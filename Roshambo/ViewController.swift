//
//  ViewController.swift
//  Roshambo
//
//  Created by Klaus Villaca on 5/26/15.
//  Copyright (c) 2015 Klaus Villaca. All rights reserved.
//

// Udacity exercise
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scisorsButton: UIButton!
    
    
    var userPlayed: Int?
    
    let resultViewString: String = "resultViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultViewController
        if segue.identifier == resultViewString {
            controller.userPlay = userPlayed
        } else if segue.identifier == "resultViewController2" {
            controller.userPlay = 3
        }
    }
    
    
    /*
     * Code
     */
    @IBAction func rockButtonAction(sender: UIButton) {
        var controller: ResultViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier(resultViewString) as! ResultViewController
        
        // Set the values to random numbers from 1 to 6
        controller.userPlay = 1
        self.presentViewController(controller, animated: true, completion: nil)
    }
    

    /*
     * Code and Segue
     */
    @IBAction func paperButtonAction(sender: UIButton) {
        userPlayed = 2;
        performSegueWithIdentifier(resultViewString, sender: self)
    }

}

