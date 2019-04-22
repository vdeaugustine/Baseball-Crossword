//
//  BoardClass.swift
//  crossWord
//
//  Created by Vincent DeAugustine on 4/13/19.
//  Copyright © 2019 Vincent DeAugustine. All rights reserved.
//

import Foundation
import UIKit

class Board {
    
    var buttonArray = [CustomButton]()
//    let topOfBoard : CGPoint
//    let bottomOfBoard : CGPoint
    let buttonsPerRowAndColumn : Int
    let buttonSize: CGFloat
    let firstXValue: CGFloat
    let firstYValue: CGFloat
    let theView : UIViewController
    let rowWidth : CGFloat
    let boardSize : CGFloat
    let bottomY : CGFloat
    var highLightedButtonIndex : Int
    
    
    init (numRowsAndColumns: Int, firstX: CGFloat, firstY: CGFloat, padding: CGFloat, view: UIViewController) {
        buttonsPerRowAndColumn = numRowsAndColumns
        firstYValue = firstY
        firstXValue = firstX + padding
        theView = view
        rowWidth = view.view.frame.width - (padding * 2)
        buttonSize = rowWidth / CGFloat(integerLiteral: numRowsAndColumns)
        boardSize = CGFloat(integerLiteral: buttonsPerRowAndColumn) * buttonSize
        bottomY = firstYValue + boardSize
        highLightedButtonIndex = 0
    }
    
    func build () {
        
        // view width - (padding * 2) is how much space a row of buttons will take up
        // space / num of buttons is how big the buttons should be
        
        var currentX = firstXValue
        var currentY = firstYValue
        var indexCounter = 0
        for _ in 1...buttonsPerRowAndColumn {
            for _ in 1...buttonsPerRowAndColumn{
                //build one button
                indexCounter += 1
                let newButton : CustomButton = CustomButton(size: buttonSize, belongsToBoard: self, index: indexCounter)
                
                // frame for button
                let frameForButton : CGRect = CGRect(x: currentX , y: currentY, width: buttonSize, height: buttonSize)
                newButton.frame = frameForButton
                newButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                newButton.setTitleColor(.black, for: .normal)
                newButton.layer.borderColor = UIColor.black.cgColor
                newButton.layer.borderWidth = 1
                newButton.addTarget(self, action: #selector(buttClicked), for: .touchUpInside)
                theView.view.addSubview(newButton)
                buttonArray.append(newButton)
                
                currentX += buttonSize
            }
                currentY += buttonSize
                currentX = firstXValue
        
            }
        
    }
    
  
    
    
    func addAWord (word: Word, thisBoard: Board) {
        
//        let firstSquare = (Int(buttonsPerRowAndColumn) * (word.row - 1) + word.column)
//        var currentSquare = firstSquare
//
//
//
//            if word.isAcross {
//                var counter = 1
//                for char in word.word {
//
//                    let currentButton = board.buttonArray[currentSquare-1]
//                    currentButton.correctLetter = "\(char)"
//                    currentButton.isBlackButton = false
//                    currentButton.backgroundColor = .white
//                    if counter > 1 {
//                        currentButton.isFirstLetter = false
//                    }
//                    counter += 1
//                    currentSquare += 1
//
//                }
//            } else {
//                var counter = 1
//                for char in word.word {
//                    let currentButton = board.buttonArray[currentSquare-1]
//                    currentButton.correctLetter = "\(char)"
//                    currentButton.isBlackButton = false
//                    currentButton.backgroundColor = .white
//                    if counter > 1 {
//                        currentButton.isFirstLetter = false
//                    }
//                    counter += 1
//                    currentSquare += 13
//                }
//            }
//
//
//
        
        
        var characterArray = [String]()
        
        for char in word.word {
            characterArray.append("\(char)")
        }
        var counter = 0
        for i in word.indexesOfLetters {
            
            
            let currentButton = buttonArray[i]
            if counter == 0 {
                currentButton.isFirstLetter = true
            }
            currentButton.correctLetter = characterArray[counter]
            counter += 1
            currentButton.setTitle(currentButton.correctLetter, for: .normal)
            currentButton.backgroundColor = .white
            currentButton.isBlackButton = false
            currentButton.setTitleColor(.black, for: .normal)
            currentButton.word = word
            
            
        }
        
    }
    
   
    
    func addNumbersToButtons (arr: [CustomButton]) {
        
        for index in 0..<arr.count {
            let cButt = arr[index]
            cButt.buttonNumber = index + 1
            
            if cButt.isFirstLetter {
                let frameOrgX = cButt.frame.origin.x
                let frameOrgY = cButt.frame.origin.y
                let thisFrame = CGRect(x: frameOrgX + 2, y: frameOrgY + 1, width: 10, height: 10)
                let numLabel = UILabel(frame: thisFrame)
                numLabel.text = String(cButt.buttonNumber)
                numLabel.font = numLabel.font.withSize(8)
                theView.view.addSubview(numLabel)
            }
            
        }
        
        
        
    }
    
    func addTargetsToButtons() {

        print("Number of buttons in buttons array: ", buttonArray.count)
        for b in buttonArray {
        
            func addTarget (button : CustomButton) -> CustomButton {
                
                button.addTarget(self, action: #selector(buttClicked), for: .touchUpInside)
                return button
                
            }
        }
        
        
    }
    
    
    @objc func buttClicked (sender: CustomButton) {
        
        
        print("Button with index: ", sender.indexInButtonArray, " was tapped")
        if highLightedButtonIndex <= buttonArray.count - 1{
            buttonArray[highLightedButtonIndex].isHighlightedButton = false
        }
        print("Button was tapped")
        if !sender.isBlackButton && sender.indexInButtonArray != highLightedButtonIndex {
            sender.isHighlightedButton = true
            highLightedButtonIndex = sender.indexInButtonArray
            print("Sender is button with correct Letter: ", sender.correctLetter)
            print("Word is ", sender.word.word)
            addSixLetterOptions(correctLetter: sender.correctLetter, button: sender, word: sender.word, board: self, viewController: theView)
        }
        
    }
    
    func addNumberToFirstLetters () {
        for button in buttonArray {
            if button.isFirstLetter {
                button.backgroundColor = .red
            }
        }
    }
    
    
    
}
