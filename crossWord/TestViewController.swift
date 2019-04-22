//
//  TestViewController.swift
//  crossWord
//
//  Created by Vincent DeAugustine on 4/19/19.
//  Copyright © 2019 Vincent DeAugustine. All rights reserved.
//

import Foundation


import UIKit

class TestViewController: UIViewController {

    var selfObject = UIViewController()

    
    override func viewDidLoad(){
//         let testButton = CustomButton(size: 30)
//        let frame = CGRect (x: 50, y: 50, width: testButton.dimensions, height: testButton.dimensions)
//        testButton.frame = frame
//        testButton.setTitle("T", for: .normal)
//
//        view.addSubview(testButton)
        super.viewDidLoad()
        selfObject = self
        
        let board = Board(numRowsAndColumns: 13, firstX: .zero, firstY: 50, padding: 8, view: selfObject)
        
        board.build()
        
        print ("Board size: ", board.boardSize)
        print ("View Width: ", self.view.frame.width)
        print ("View Height: ", self.view.frame.height)
        print ("Button size: ", board.buttonSize)
        
        
        
        
        let puzz1 = PuzzleOne()
        
        for w in puzz1.array {
            board.addAWord(word: w, thisBoard: board)
        }
        
        
        
        
       board.addTargetsToButtons()
        board.addNumberToFirstLetters()
        
        
       // addSixLetterOptions(correctLetter: ":)")
        
        
//        for b in board.buttonArray {
//            b.setTitle(b.correctLetter, for: .normal)
//        }
        
        
    }
    
    
    
    
    
    
    
  


}
