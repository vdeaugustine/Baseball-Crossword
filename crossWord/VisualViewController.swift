//
//  VisualViewController.swift
//  crossWord
//
//  Created by Vincent DeAugustine on 4/21/19.
//  Copyright © 2019 Vincent DeAugustine. All rights reserved.
//

import Foundation
import UIKit

class VisualViewController : UIViewController {
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var b10: UIButton!
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b13: UIButton!
    
    @IBAction func b1Pressed(_ sender: UIButton) {
        sender.backgroundColor = .black
    }
}
