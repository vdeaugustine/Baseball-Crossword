//
//  PuzzleOne.swift
//  crossWord
//
//  Created by Vincent DeAugustine on 4/20/19.
//  Copyright © 2019 Vincent DeAugustine. All rights reserved.
//

import Foundation

class PuzzleOne {
    
    let array : [Word]
    
    let cain = Word(newWord: "CAIN", newHint: "World Series Champion Center Fielder in 2016", newRow: 1, newColumn: 2, wordIsAcross: false)
    let hosmer = Word(newWord: "HOSMER", newHint: "Current First Baseman for the San Diego Padres", newRow: 1, newColumn: 6, wordIsAcross: true)
    let kershaw = Word(newWord: "KERSHAW", newHint: "Most Recent Dodger MVP", newRow: 3, newColumn: 4, wordIsAcross: true)
    let harper = Word(newWord: "HARPER", newHint: "Signed a 13 Year, $330 million contract with the Phillies in 2019", newRow: 1, newColumn: 6, wordIsAcross: false)
    let trout = Word(newWord: "TROUT", newHint: "The Best Player of All Time and is Currently Playing", newRow: 5, newColumn: 9, wordIsAcross: true)
    let altuve = Word(newWord: "ALTUVE", newHint: "MVP and World Series Champion in 2017", newRow: 3, newColumn: 9, wordIsAcross: false)
    let betts = Word(newWord: "BETTS", newHint: "MVP and World Series Champion in 2018", newRow: 3, newColumn: 13, wordIsAcross: false)
    let yelich = Word(newWord: "YELICH", newHint: "Came Out of Nowhere to Win the NL MVP in 2018", newRow: 6, newColumn: 1, wordIsAcross: false)
    let freeman = Word(newWord: "FREEMAN", newHint: "All Star First Baseman for the Atlanta Braves", newRow: 8, newColumn: 6, wordIsAcross: true)
    let hernandez = Word(newWord: "HERNANDEZ", newHint: "Won the Cy Young for the Mariners with a Losing Record", newRow: 11, newColumn: 1 , wordIsAcross: true)
    let tulowitzki = Word(newWord: "TULOWITZKI", newHint: "This All Star Shortstop Went to CSULB", newRow: 13, newColumn: 1, wordIsAcross: true)
    let shaw = Word(newWord: "SHAW", newHint: "Can Play Second Base, Third Base or First Base for the Brewers", newRow: 10, newColumn: 13, wordIsAcross: false)
    
    
    init () {
         array = [cain, hosmer, kershaw, harper, trout, altuve, betts, yelich, freeman, hernandez, tulowitzki, shaw]
    }
    
    
    
}
