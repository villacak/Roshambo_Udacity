//
//  ResultViewController.swift
//
//
//  Created by Klaus Villaca on 5/26/15.
//
//

import UIKit

class ResultViewController: UIViewController {
    
    /*
     * Outlets
     */
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var winnerLabel: UILabel!
    
    // Vars to hold values from user and bot choices
    var userPlay: Int?
    var botPlay: Int?
    
    // Winner if any
    let userWon: String = "User"
    let botWon: String = "iPhone"
    let tied : String = "Tie"
    
    /*
     * Enum with play options
     */
    enum play: Int {
        case rock, paper, scisors
    }
    
    
    /*
     * Enum to check if was user or bot
     */
    enum userOrBot {
        case userEnum, botEnum
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        botPlay = randomDiceValue()
        var userPlayEnum: play?
        var botPlayEnum: play?
        
        if let userPlay = self.userPlay {
            userPlayEnum = convertValueToEnum(userPlay)
        }
        
        if let botPlay = self.botPlay {
            botPlayEnum = convertValueToEnum(botPlay)
        }
        
        checkWinner(userPlayEnum!, bot: botPlayEnum!)
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     *    dismiss this view controller
     */
    @IBAction func playAgainButtonAction(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    /*
     * Function that check for the winner based on the user selection on the first screen
     */
    func checkWinner(user: play, bot: play) {
        if user == bot {
            imageView.image = UIImage(named: "tie")
            winnerLabel.text = tied
        } else {
            // Show the user option as winner
            checkWhatShouldDisplay(user, bot: bot)
        }
    }
    
    
    
    /*
     * Function helper for the checkWinner function, this functions display the right image
     * and also display the winner
     */
    func checkWhatShouldDisplay(user: play, bot: play) {
        var sideThatWon: userOrBot?
        if (user == play.rock && bot == play.scisors) {
            imageView.image = UIImage(named: "rockCrushScisors")
            sideThatWon = userOrBot.userEnum
        } else if  (user == play.paper && bot == play.rock) {
            imageView.image = UIImage(named: "paperCoverRock")
            sideThatWon = userOrBot.userEnum
        } else if  (user == play.scisors && bot == play.paper) {
            imageView.image = UIImage(named: "scisorsCutPaper")
            sideThatWon = userOrBot.userEnum
        } else if (bot == play.rock && user == play.scisors) {
            imageView.image = UIImage(named: "rockCrushScisors")
            sideThatWon = userOrBot.botEnum
        } else if (bot == play.paper && user == play.rock) {
            imageView.image = UIImage(named: "paperCoverRock")
            sideThatWon = userOrBot.botEnum
        } else if (bot == play.scisors && user == play.paper) {
            imageView.image = UIImage(named: "scisorsCutPaper")
            sideThatWon = userOrBot.botEnum
        }
        
        if (sideThatWon == userOrBot.userEnum) {
            winnerLabel.text = userWon
        } else {
            winnerLabel.text = botWon
        }
        
    }
    
    
    /**
    * Randomly generates a Int from 1 to 3
    * 1 - Rock
    * 2 - Paper
    * 3 - Scisors
    */
    func randomDiceValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    
    /*
     * Function that convert int to enum, the int has to be in the range from 1 to 3
     */
    func convertValueToEnum(valueToConvert: Int) -> play {
        var playValueToReturn: play?
        if (valueToConvert == 1) {
            playValueToReturn = play.rock
        } else if (valueToConvert == 2) {
            playValueToReturn = play.paper
        } else if (valueToConvert == 3) {
            playValueToReturn = play.scisors
        }
        return playValueToReturn!
    }
}
