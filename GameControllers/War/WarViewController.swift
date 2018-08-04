//
//  File.swift
//  BDPA_finalApp
//
//  Created by Bryce Ellis on 7/29/18.
//  Copyright © 2018 Bryce Ellis. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class WarViewController: UIViewController {
    
    
    
     @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var rightScoreLabel: UILabel!
    var rightScore = 0
    
     @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftScoreLabel: UILabel!
    var leftScore = 0
    
        var gameIsActive  : Bool = false
        var playSoundFile : AVAudioPlayer!
    var playLoseSoundFile : AVAudioPlayer!
    var playWinSoundFile  : AVAudioPlayer!
    
    let cardNames = ["card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace"]
    
    var cardsInDeck: Int = 52
    
    override func viewDidLoad() {
        
        cardsInDeck = 52
        
        super.viewDidLoad()
        playGameSound()
        
        
    }
    
    func endGame() {
        
            playSoundFile.stop()
        let yourAlert = UIAlertController(title: "GAME OVER", message: "You scored: \(leftScore) points.", preferredStyle: UIAlertControllerStyle.alert)
        yourAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (handler) in
            //You can also add codes while pressed this button
            self.performSegue(withIdentifier: "game1DidEnd", sender: self)
        }))
        self.present(yourAlert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var cardsInDeckLabel: UILabel!
    func subtractCardsInDeck() {
        cardsInDeck -= 2
        cardsInDeckLabel.text = String("Cards in deck: \(cardsInDeck)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func dealTapped(_ sender: Any) {
        
        if cardsInDeck == 2 {
            endGame()
        }
        subtractCardsInDeck()
        
        
        
        // Randomize left number from 0 to 12
        let leftNumber = Int(arc4random_uniform(13))
        
        // Set the left image
        leftImageView.image = UIImage(named: cardNames[leftNumber])
        
        // Randomize right number from 0 to 12
        let rightNumber = Int(arc4random_uniform(13))
        
        // Set the right image
        rightImageView.image = UIImage(named: cardNames[rightNumber])
        
        // Compare the card numbers
        if leftNumber > rightNumber {
            playWinSound()
            // Left card wins
            
            // Increment the score
            leftScore += 1
            
            // Update the label
            leftScoreLabel.text = String(leftScore)
        }
        else if leftNumber == rightNumber {
            // It's a tie
        }
        else {
            playLoseSound()
            // Right card wins
            
            // Increment the score
            rightScore += 1
            
            // Update the label
            rightScoreLabel.text = String(rightScore)
        }
        
        
    }
    
    

    
    
    
    func playGameSound() {
        
        let path = Bundle.main.path(forResource: "Tbone and friends", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            playSoundFile = try AVAudioPlayer(contentsOf: url)
            playSoundFile.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
        playSoundFile.play()
    }
    
    
 
    func playLoseSound() {
        
        let path = Bundle.main.path(forResource: "WarLose", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            playLoseSoundFile = try AVAudioPlayer(contentsOf: url)
            playLoseSoundFile.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
        playLoseSoundFile.play()
        
    }
    
    func playWinSound() {
        let path = Bundle.main.path(forResource: "WarWin", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            playWinSoundFile = try AVAudioPlayer(contentsOf: url)
            playWinSoundFile.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
        playWinSoundFile.play()
    }
    
    
    
    
    

    
} // Class
