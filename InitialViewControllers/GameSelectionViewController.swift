//
//  ViewController.swift
//  BDPA_finalApp
//
//  Created by Bryce Ellis on 8/3/18.
//  Copyright © 2018 Bryce Ellis. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class GameSelectionViewController: UIViewController {
    
    
    var playSoundFile: AVAudioPlayer!
    
    @IBAction func playGameSoundForWar(_ sender: Any) {
        playGameSounds()
    }
    

    
    @IBAction func playGameSoundForBullsEye(_ sender: Any) {
        playGameSounds()
    }
    
    
    @IBAction func playGameSoundForTTT(_ sender: Any) {
        playGameSounds()
    }
    
    
    func playGameSounds() {
        let path = Bundle.main.path(forResource: "Completion", ofType: "wav")!
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
