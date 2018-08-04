//
//  TicTacToeBoard.swift
//  BDPA_finalApp
//
//  Created by Bryce Ellis on 7/30/18.
//  Copyright © 2018 Bryce Ellis. All rights reserved.
//

import Foundation
import SceneKit
import UIKit

protocol TicTacToeBoardDelegate: class {
    func oWon()
    func tie()
    func xWon()
}

class TicTacToeBoard: SCNScene {
    
    // MARK: - Lazy Variables
    lazy var currentSymbol:String = "X"
    lazy var symbols: [ [ String ] ] = [ [ "", "", "" ], [ "", "", "" ], [ "", "", "" ] ]
    lazy var squares: [[SCNNode]] = {
        var squaresArray: [[SCNNode]] = [ [],[],[] ]
        
        for row in 0...2 {
            for column in 0...2 {
                
                let square = newSquareNode()
                
                let x:Float = Float(row) * 0.1
                let y:Float = Float(column) * 0.1
                let z: Float = -1
                
                let postion = SCNVector3(x,y,z)
                square.position = postion
                
                squaresArray[row].append(square)
                rootNode.addChildNode(square)
            }
        }
        
        return squaresArray
    }()


    init(color: UIColor, xColor: UIColor, oColor: UIColor) {
        super.init()
        
        _ = squares
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Helper Function a node with a box in it to Create a board: 9 Squares arranged in a 3x3 grid.
    func newSquareNode() -> SCNNode {
        let box    = SCNBox(width: 0.09, height: 0.09, length: 0.01, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = boardColor
        let square = SCNNode(geometry: box)
        
        return square
        
    }
    
    // PLACE MOVES
    func newSymbolNode(on square: SCNNode, withSymbol symbol: String, andColor color: UIColor) -> SCNNode {
        
        let text = SCNText(string: symbol, extrusionDepth: 0.03)
        text.font = UIFont(name: "Arial", size: 0.07)
        text.firstMaterial?.diffuse.contents = color
        
        
        let (minVector, maxVector) = text.boundingBox
        let xOffset = (maxVector.x - minVector.x)/2 + minVector.x
        let yOffset = (maxVector.y - minVector.y)/2 + minVector.y
        let zOffset: Float = 0
        
        let symbol = SCNNode(geometry: text)
        symbol.pivot = SCNMatrix4MakeTranslation(xOffset, yOffset, zOffset)
        
        symbol.position = square.position
        
        return symbol
        
    }
    
    func tapped(on node: SCNNode) {
        
        
        // Find the row and column of the node that was tapped
        var row = -1
        var column = -1
        for rowIndex in 0..<squares.count {
            for columnIndex in 0..<squares[rowIndex].count {
                if squares[rowIndex][columnIndex] == node {
                    row = rowIndex
                    column = columnIndex
                    break
                }
            }
        }
        
        guard row > -1 && column > -1 else {
            // The node that was tapped wasn't a square on the board
            return
        }
        
        guard symbols[row][column] == "" else {
            // A move has already been played on this square
            return
        }
        
        let symbol = currentSymbol
        
        
        
        let symbolColor: UIColor
        if symbol == "X" {
            symbolColor = UIColor.red
        } else {
            symbolColor = UIColor.cyan
        }
        
        
        
        
        // 2
        let symbolNode = newSymbolNode(on: node, withSymbol: symbol, andColor: symbolColor)
        rootNode.addChildNode(symbolNode)
        
        symbols[row][column] = symbol
        
        // 3
        if currentSymbol == "X" {
            currentSymbol = "O"
        } else {
            currentSymbol = "X"
        }
    }


//        switch boardColor {
//        case UIColor.black:
//            symbolColor = color[2]
//        case UIColor.white:
//            symbolColor = color[1]
//        default:
//            symbolColor = color[0]
//        }
//
//
//        let symbolNode = newSymbolNode(on: node, withSymbol: symbol, andColor: symbolColor)
//        rootNode.addChildNode(symbolNode)
//
//        if currentSymbol == "X" {
//            currentSymbol = "O"
//        } else {
//            currentSymbol = "X"
//        }
//    }
    
} // Class

