//
//  SixLetters.swift
//  crossWord
//
//  Created by Vincent DeAugustine on 4/20/19.
//  Copyright © 2019 Vincent DeAugustine. All rights reserved.
//

import Foundation
import UIKit


func addSixLetterOptions (correctLetter: String, button: CustomButton, word: Word, board: Board, viewController: UIViewController) -> [UIButton]{
    
    let arrofButtons = [UIButton]()
    let theView = button.board.theView
    let board = button.board
    let hintBox = HintBox(board: board, word: word, viewController: viewController)
    let alph = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R","S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    let padding : CGFloat = 8
    let buttSize : CGFloat = 60
    let endPatting : CGFloat = (theView.view.frame.width - (buttSize * 5 + padding * 4)) / 2
    var yVal : CGFloat = hintBox.frame.maxY + 8
    var xVal : CGFloat = endPatting
    let correctLetterAtIterator = Int.random(in: 1...5)
    
    for j in 1...2 {
        for i in 1...5 {
            let randInt = Int.random(in: 0...25)
            let randLetter = alph[randInt]
            //build a button
            let button = UIButton(frame: CGRect(x: xVal, y: yVal, width: buttSize, height: buttSize))
            button.backgroundColor = .gray
            if (i == correctLetterAtIterator) {
                button.setTitle(correctLetter, for: .normal)
            } else { button.setTitle(randLetter, for: .normal)}
            theView.view.addSubview(button)
  
                xVal += buttSize + padding
           
        }
    yVal += buttSize + padding
    xVal = endPatting
    }
    
    return arrofButtons
    
}
