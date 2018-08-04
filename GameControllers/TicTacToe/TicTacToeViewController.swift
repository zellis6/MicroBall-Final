//
//  TicTacToeViewController.swift
//  BDPA_finalApp
//
//  Created by Bryce Ellis on 7/30/18.
//  Copyright © 2018 Bryce Ellis. All rights reserved.
//

import Foundation
import UIKit
import ARKit

class TicTacToeViewController: UIViewController, ARSCNViewDelegate {
    
//    // This is the Board object created
    
    
      var board: TicTacToeBoard = TicTacToeBoard(color: boardColor, xColor: xColor, oColor: oColor)
    

    // This Code Sets Up Augmented Reality Scene
    @IBOutlet weak var sceneView: ARSCNView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        sceneView.scene = board
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(boardColor)
    }
    
    
    // Can add switchTurns here
    @IBAction func didTap(_ recognizer: UITapGestureRecognizer) {
        
        let location = recognizer.location(in: sceneView)
        
        let options: [SCNHitTestOption: Any] = [SCNHitTestOption.firstFoundOnly: true,]
        
        let sceneHitTestResults: [SCNHitTestResult] = sceneView.hitTest(location, options: options)
        
        guard let node = sceneHitTestResults.first?.node else {
            return
        }
        
        board.tapped(on: node)

    }
  
}
