//
//  ARticTacToe.swift
//  BDPA_finalApp
//
//  Created by Bryce Ellis on 7/29/18.
//  Copyright © 2018 Bryce Ellis. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

var boardColor:UIColor = UIColor.white
var xColor: UIColor = UIColor.black
var oColor: UIColor = UIColor.lightGray


class AnimationsTTT: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    
         let colors:  [UIColor] = [UIColor.white,UIColor.green,UIColor.yellow,UIColor.blue,UIColor.black]
    let returnColor:  [String]  = ["Default","green","yellow","blue","black"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return returnColor[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        boardColor = colors[row]
        
    }
    
    @IBOutlet weak var pickColor: UIPickerView!
    
    
    @IBOutlet weak var animatePG: UIButton!
    @IBOutlet weak var animateHome: UIButton!
    
    @IBAction func returnHome(_ sender: Any) {
      print("returning Home")
      returnHomeSound()
    }
    
    @IBOutlet weak var animateLabel: UIView!
    
    @IBAction func readyToPlay(_ sender: Any) {
        
        print("Starting game")
        playGameSound()

        animatePG.isHidden = true
        animateHome.isHidden = true
        
        UIView.animate(withDuration: 3.0, animations: {
            self.animateLabel.frame = CGRect(x: 20, y: 45, width: 0, height: 0)
        }) {(finished) in
             self.performSegue(withIdentifier: "startAR", sender: self)
        }
        
    }
    
    var playSoundFile: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func returnHomeSound()  {
        let path = Bundle.main.path(forResource: "ReturnHome", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            playSoundFile = try AVAudioPlayer(contentsOf: url)
            playSoundFile.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
        playSoundFile.play()
    }
    
    func playGameSound() {
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
    

} // CLASS
