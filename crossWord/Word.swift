//
//  WordClass.swift
//  crossWord
//
//  Created by Vincent DeAugustine on 4/13/19.
//  Copyright © 2019 Vincent DeAugustine. All rights reserved.
//

import Foundation
import UIKit

class Word {
    
    var word: String
    var row: Int
    var column: Int
    var isAcross: Bool
    var hint : String
    var wordLength : Int
    var indexesOfLetters = [Int]()
    
    init(newWord: String, newHint: String, newRow: Int, newColumn: Int, wordIsAcross: Bool ) {
        word = newWord
        hint = newHint
        row = newRow
        column = newColumn
        isAcross = wordIsAcross
        wordLength = newWord.count
        
        let wordCount = word.count
        let startIndex = (((row - 1) * 13) + column) - 1
        
        for counter in 0..<wordCount {
            if self.isAcross {
                indexesOfLetters.append(startIndex + counter)
            } else {
                indexesOfLetters.append(startIndex + 13*counter)
            }
        }
    }
    
    func testPrint() {
        print(word, "Row: ", row, "Col: ", column, "Is Across: ", isAcross)
    }
    
    
}
