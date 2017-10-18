//
//  OutputViewController.swift
//  Calculator
//
//  Created by Andrew on 10/11/17.
//  Copyright © 2017 Andrew. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController, OutputInterface {
   
    var stillTyping = false
    
    func display(_ result: String) {
        if stillTyping {
            if Label.text!.characters.count < 18 {
                Label.text = Label.text! + result
            }
        } else {
            Label.text = result
            stillTyping = true
        }
    }
    
    @IBOutlet weak var Label: UILabel!
}

