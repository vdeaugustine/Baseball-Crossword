//
//  HintBox.swift
//  crossWord
//
//  Created by Vincent DeAugustine on 4/20/19.
//  Copyright © 2019 Vincent DeAugustine. All rights reserved.
//

import Foundation
import UIKit


class HintBox {

    let hint : String
    let frame : CGRect
    
    
     init (board: Board, word: Word, viewController: UIViewController)  {
        
        self.hint = word.hint
        print("Hint: ",self.hint)
        self.frame = CGRect(x: board.firstXValue, y: board.bottomY + 8, width: board.boardSize, height: 40)
        let hintBox = UILabel(frame: frame)
        hintBox.text = hint
        hintBox.font = UIFont(name: "Helvetica" , size: 20)
        hintBox.textAlignment = .center
        hintBox.backgroundColor = .gray
        hintBox.textColor = .white
        hintBox.adjustsFontSizeToFitWidth = true
        viewController.view.addSubview(hintBox)
    }

}

