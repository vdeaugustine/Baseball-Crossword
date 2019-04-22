//
//  Button.swift
//  crossWord
//
//  Created by Vincent DeAugustine on 4/14/19.
//  Copyright © 2019 Vincent DeAugustine. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    var correctLetter: String // the letter that is supposed to go in the string
    var isBlackButton : Bool
    var currentLetter : String // the letter that the user put in that string
    var dimensions : CGFloat // the size that the user wants to make the button. it will be a square so one size will work
    var isCorrect : Bool = false
    var buttonNumber : Int
    var letterIsVisible : Bool = false
    var isFirstLetter : Bool = false
    var board : Board
    var word: Word = Word(newWord: "", newHint: "", newRow: 0, newColumn: 0, wordIsAcross: true)
    var letterOptions : [String] = [String]()
    var isHighlightedButton = false
    var indexInButtonArray : Int
    
    
    
    init (size: CGFloat, number: Int, correct: String, isBlack: Bool, belongsToBoard: Board, index: Int) {
       
        self.correctLetter = correct
        self.isBlackButton = isBlack
        self.currentLetter = ""
        self.dimensions = size
        self.isCorrect = currentLetter == correctLetter
        self.buttonNumber = number
        self.board = belongsToBoard
        self.indexInButtonArray = index
        
        let alph = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R","S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        let randInt = Int.random(in: 0...25)
        let randLetter = alph[randInt]
        let indexOfCorrectLetter = Int.random(in: 1...5)
        for i in 0...5 {
            if indexOfCorrectLetter == i {
                letterOptions.append(correctLetter)
            } else {
                letterOptions.append(randLetter)
            }
        }
        
        print("This Button's Letter Options: ", letterOptions)
        super.init(frame: .zero)
    }
    
    init (size: CGFloat, belongsToBoard: Board, index: Int) {
        
        correctLetter = ""
        isBlackButton = true
        currentLetter = ""
        dimensions = size
        isCorrect  = false
        buttonNumber = 0
        letterIsVisible  = false
        board = belongsToBoard
        indexInButtonArray = index
        
        
        let alph = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R","S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        
        for i in 0...5 {
            let randInt = Int.random(in: 0...25)
            let randLetter = alph[randInt]
            let indexOfCorrectLetter = Int.random(in: 1...5)
            if indexOfCorrectLetter == i {
                letterOptions.append(correctLetter)
            } else {
                letterOptions.append(randLetter)
            }
        }
        
        print("This Button's Letter Options: ", letterOptions)
       
        
        super.init(frame: .zero)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkIfCorrect () -> Bool {
        if currentLetter == correctLetter {
            return true
        } else {
            return false
        }
    }
    
    func buildButton (xPoint : CGFloat, yPoint: CGFloat) {
        
        let newFrame = CGRect(x: xPoint, y: yPoint, width: dimensions, height: dimensions)
        self.frame = newFrame
        
    }
    
   
    
    
    
}
