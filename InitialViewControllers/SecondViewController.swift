//
//  SecondViewController.swift
//  BDPA_finalApp
//
//  Created by Bryce Ellis on 8/3/18.
//  Copyright © 2018 Bryce Ellis. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class SecondViewController: UIViewController {
    
    var playSoundFile: AVAudioPlayer!

    @IBOutlet weak var animateLabel: UIImageView!
    @IBAction func start(_ sender: Any) {
        print("First Page Completed. Select A Game.")
        playPlayGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateLabel.isHidden = false
        animateMicroBall()
        playHustleOn()
        
    }
    
    func animateMicroBall() {
        UIView.animate(withDuration: 3.0, animations: {
            self.animateLabel.frame = CGRect(x: 100, y: 175, width: 180, height: 79)
        })
    }
    
    func playHustleOn() {
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            playSoundFile = try AVAudioPlayer(contentsOf: url)
            playSoundFile.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        playSoundFile.play()
    }
    
    func playPlayGame() {
        let path = Bundle.main.path(forResource: "PlayGame", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            playSoundFile = try AVAudioPlayer(contentsOf: url)
            playSoundFile.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        playSoundFile.play()
    }
    
}
