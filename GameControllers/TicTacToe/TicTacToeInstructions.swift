//
//  TicTacToeInstructions.swift
//  BDPA_finalApp
//
//  Created by Bryce Ellis on 8/3/18.
//  Copyright © 2018 Bryce Ellis. All rights reserved.
//

import Foundation
import UIKit

class TicTacToeInstructions: UIViewController {
    
    
    @IBOutlet weak var forTheDummies: UILabel!
    @IBOutlet weak var twoPlayerGame: UILabel!
    @IBOutlet weak var topInstruction: UITextView!
    @IBOutlet weak var gotit_oneOutlet: UIButton!
    @IBAction func gotit_one(_ sender: Any) {
        forTheDummies.isHidden = false
        twoPlayerGame.isHidden = true
        gotit_oneOutlet.isHidden   = true
         topInstruction.isHidden   = true

        
        
        middleInstruction.isHidden = false
        gotit_twoOutlet.isHidden   = false
    }
    
    @IBOutlet weak var gotit_twoOutlet: UIButton!
    @IBOutlet weak var middleInstruction: UITextView!
    @IBAction func gotit_two(_ sender: Any) {
        middleInstruction.isHidden = true
          gotit_twoOutlet.isHidden = true
        
        lastInstruction.isHidden   = false
            readyButton.isHidden   = false
    }
    
    
    @IBOutlet weak var readyButton: UIButton!
    @IBOutlet weak var lastInstruction: UITextView!
}
