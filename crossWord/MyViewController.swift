//
//  ViewController.swift
//  crossWord
//
//  Created by Vincent DeAugustine on 4/10/19.
//  Copyright © 2019 Vincent DeAugustine. All rights reserved.
//


// to do: need to make buttons their own class so they can have things like
// a property that says it is not able to be edited or clicked
// also a property to say what row and column they are on

import UIKit

class MyViewController: UIViewController, UITextFieldDelegate {

    let accWords = ["TROUT", "ALTUVE", "KERSHAW", "BREGMAN", "MARTINEZ"]
    let downWords = ["BELLINGER", "DONALDSON", "LONGORIA", "JUDGE"]
    let squareSize: CGFloat = 31
    var ButtonArray = [[UIButton]]()
    var Board2DArray = [[String]]()
    let numSquares = 13
    
    
    func initBoard2Darray () {
        
        // this is done correctly
        for _ in 0...12 {
            var strArr = [String]()
            for _ in 0...12 {
                strArr.append("")
            }
            Board2DArray.append(strArr)
        }
        
        
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard2Darray()
        
        
        
        buildBoard(size: numSquares)
        addNumbersToSquares()
        //Make all buttons black by default
        for secondArray in ButtonArray {
            for item in secondArray {
                item.backgroundColor = .black
            }
        }

        fillAcrossWords()
        fillVerticalWords()
        makeSomeBlack()
        addNumbersToSquares(row: 0, col: 1, number: 1)
        addNumbersToSquares(row: 0, col: 5, number: 2)
        addNumbersToSquares(row: 2, col: 3, number: 3)
        addNumbersToSquares(row: 2, col: 12, number: 4)
        addNumbersToSquares(row: 4, col: 8, number: 5)
        addNumbersToSquares(row: 5, col: 0, number: 7)
        addNumbersToSquares(row: 7, col: 5, number: 6)
        addNumbersToSquares(row: 10, col: 0, number: 8)
        addNumbersToSquares(row: 9, col: 12, number: 9)
        addNumbersToSquares(row: 12, col: 0, number: 10)
        
        createHintBox(hint: "MVP in 2018")
        
        
        func fillSquaresWithLetters () {
            for row in 0...numSquares-1 {
                for col in 0...numSquares-1 {
                    let currentButton = ButtonArray[row][col]
                    currentButton.setTitle(Board2DArray[row][col] , for: .normal)
                    
                    currentButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                    currentButton.setTitleColor(.black, for: .normal)
                    print("Button label = ",currentButton.titleLabel?.text as Any)
                    ButtonArray[row][col] = currentButton
                }
            }
        }
        
        fillSquaresWithLetters()
        
        
        
        
        
        ButtonArray[0][1].addTarget(self, action: #selector(buttClicked), for: .touchUpInside)

        for row in 0..<13 {
            for col in 0..<13 {
            ButtonArray[row][col] = addAtarget(butt: ButtonArray[row][col])
            }
        }
        
        
//        ******************************************************************************
////        test to see if Board2DArray is filled correctly
//        for secArr in Board2DArray {
//            var strArr = [String]()
//            for currString in secArr {
//                strArr.append(currString)
//            }
//            print(strArr)
//        }
        
//       ******************************************************************************
        
    }
    
    @objc func buttClicked (sender: UIButton) {
        
        
//        if sender.backgroundColor == .red {
//            sender.backgroundColor = .white
//        } else {
//            sender.backgroundColor = .red
//        }
        
        addSixLetterOptions(correctLetter: "T")
        
        
    }
    
    
    @objc func letterGuessClicked (sender: UIButton, letterGoTo: UIButton) {
        
        let letter = sender.titleLabel?.text
        letterGoTo.setTitle(letter, for: .normal)
        print("Button clicked")
        
    }
    
    func addAtarget (butt: UIButton) -> UIButton{
        
        butt.addTarget(self, action: #selector(buttClicked), for: .touchUpInside)
        
        return butt
    }
    
//    func addTargetForChoice (butt: UIButton) -> UIButton {
//        butt.addTarget(self, action: #selector(letterGuessClicked), for: .touchUpInside)
//        return butt
//    }
    
    func addSixLetterOptions (correctLetter: String) {
        
        let alph = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R","S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        let padding : CGFloat = 8
        let buttSize : CGFloat = 60
        let endPatting : CGFloat = (self.view.frame.width - (buttSize * 5 + padding * 4)) / 2
        let yVal : CGFloat = 570
        var xVal : CGFloat = endPatting
        let correctLetterAtIterator = Int.random(in: 1...5)
        
        
        for i in 1...5 {
            let randInt = Int.random(in: 0...25)
            let randLetter = alph[randInt]
            //build a button
            let button = UIButton(frame: CGRect(x: xVal, y: yVal, width: buttSize, height: buttSize))
            button.backgroundColor = .gray
                if (i == correctLetterAtIterator) {
                    button.setTitle(correctLetter, for: .normal)
                } else { button.setTitle(randLetter, for: .normal)}
            view.addSubview(button)
            xVal += buttSize + padding
        }
        
    
    }
    
    func createHintBox (hint: String) {
        
        let hintboxCenter : CGFloat = self.view.frame.width / 2
        
        
        
        let hintbox = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 16, height: 50))
        hintbox.center = CGPoint(x:hintboxCenter, y:500)
        hintbox.textAlignment = .center
        hintbox.text = hint
        hintbox.backgroundColor = .blue
        self.view.addSubview(hintbox)
      
    }
    
    
    
    
    func addNumbersToSquares () {
        // right now this adds numbers to all squares
        var counter = 1
        for secondArray in ButtonArray {
                for currButton in secondArray {
                    let frameOrgX = currButton.frame.origin.x
                    let frameOrgY = currButton.frame.origin.y
                    let numLabel = UILabel(frame: CGRect(x: frameOrgX + 2, y: frameOrgY + 1, width: 10, height: 10))
                    numLabel.text = String(counter)
                    numLabel.font = numLabel.font.withSize(8)
                    self.view.addSubview(numLabel)
                    counter += 1
        
                }
        }
    }
    
    
    
    func addNumbersToSquares (row: Int, col: Int, number: Int) {
        
        let currButton = ButtonArray[row][col]
        let frameOrgX = currButton.frame.origin.x
        let frameOrgY = currButton.frame.origin.y
        let numLabel = UILabel(frame: CGRect(x: frameOrgX + 2, y: frameOrgY + 1, width: 10, height: 10))
        print ("Adding number: ", number)
        numLabel.text = String(number)
        numLabel.font = numLabel.font.withSize(8)
        self.view.addSubview(numLabel)
        
    }
    
    func addTextFieldToSquares (row: Int, col: Int) {
        let currButton = ButtonArray[row][col]
        let frameOrgX = currButton.frame.origin.x
        let frameOrgY = currButton.frame.origin.y
        let newField = UITextField()
        newField.frame = CGRect(x: frameOrgX, y: frameOrgY, width: squareSize, height: squareSize)
        newField.textAlignment = .center
//        newField.placeholder = "Testing"
        view.addSubview(newField)
    }
    
    
    
    func makeOneRowOfButtons (x: Int, y: Int, numButtons: Int ) -> [UIButton]{
        
        var ButtonArray = [UIButton]()
        var cXint = CGFloat(integerLiteral: x)
        for _ in 1...numButtons {
            
            let currX = CGFloat(cXint)
            let currY = CGFloat(y)
            let button = UIButton(frame: CGRect(x:currX, y: currY, width: CGFloat(squareSize), height: CGFloat(squareSize)))
    
            button.backgroundColor = .white
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
            
            self.view.addSubview(button)
            
            ButtonArray.append(button)
            cXint += squareSize
        }
        
        return ButtonArray
        
    }
    
    func fillAcrossWords () {
        
        
        let currStr = accWords[0]
        
        func fillOneWordAcross (word: String, row: Int, col: Int) {
            let leng = word.count

            var curCol = col
            var offset = 0
            for _ in 0..<leng {
                let indx = word.index(word.startIndex, offsetBy: offset)

                let curChar = word[indx]
                print(curChar)
                ButtonArray[row][curCol].backgroundColor = .white
//                ButtonArray[row][curCol].setTitle(String(curChar), for: .normal)
                Board2DArray[row][curCol] = String(curChar)
//                ButtonArray[row][curCol].setTitleColor(.black, for: .normal)
                offset += 1
                curCol += 1

            }

        }

//        print(currStr)
//        fillOneWordAcross(word: currStr, row: 0, col: 0)
//        fillOneWordAcross(word: accWords[1], row: 4, col: 5)
//        fillOneWordAcross(word: accWords[2], row: 7, col: 4)
//        fillOneWordAcross(word: accWords[3], row: 5, col: 1)
//        fillOneWordAcross(word: accWords[4], row: 12, col: 3)
        
        fillOneWordAcross(word: "HOSMER", row: 0, col: 5)
        fillOneWordAcross(word: "KERSHAW", row: 2, col: 3)
        fillOneWordAcross(word: "TROUT", row: 4, col: 8)
        fillOneWordAcross(word: "FREEMAN", row: 7, col: 5)
        fillOneWordAcross(word: "HERNANDEZ", row: 10, col: 0)
        fillOneWordAcross(word: "TULOWITZKI", row: 12, col: 0)
        
        
        
    }
    
    func fillVerticalWords () {
        let currStr = downWords[0]
        func fillOneWordDown (word: String, row: Int, col: Int) {
            let leng = word.count
            var curRow = row
            var offSet = 0
            for _ in 0..<leng {
                let ind = word.index(word.startIndex, offsetBy: offSet)
                let curChar = word[ind]
                print(curChar)
                ButtonArray[curRow][col].backgroundColor = .white
//                ButtonArray[curRow][col].setTitle(String(curChar), for: .normal)
                Board2DArray[curRow][col] = String(curChar)
//                ButtonArray[curRow][col].setTitleColor(.black, for: .normal)
                offSet += 1
                curRow += 1
                
            }
        }
        
        fillOneWordDown(word: "CAIN", row: 0, col: 1)
        fillOneWordDown(word: "HARPER", row: 0, col: 5)
        fillOneWordDown(word: "ALTUVE", row: 2, col: 8)
        fillOneWordDown(word: "YELICH", row: 5, col: 0)
        fillOneWordDown(word: "BETTS", row: 2, col: 12)
        fillOneWordDown(word: "SHAW", row: 9, col: 12)
        
    }
    
    func buildBoard (size: Int) {
        
        
        var yValue = self.view.frame.height / 13
        for _ in 1...size {
            ButtonArray.append(makeOneRowOfButtons(x: 6, y: Int(yValue), numButtons: size))
            yValue += squareSize
        }
        
    }
    
    
    func makeSomeBlack () {
        

        
        for row in 0..<13 {
            for col in 0..<13 {
                if Board2DArray[row][col] == "" || Board2DArray[row][col] == " " {
                    ButtonArray[row][col].backgroundColor = .black
                }
                else {
                    print("Not filling this square black because it has the string: ", Board2DArray[row][col])
                }
            }
        }
        
    }
    
    

    
    

}
