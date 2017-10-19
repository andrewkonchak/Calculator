//
//  OutputViewController.swift
//  Calculator
//
//  Created by Andrew on 10/11/17.
//  Copyright © 2017 Andrew. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController, OutputInterface {
    
    func display(_ result: String) {
        displayLabel.text = displayLabel.text! + result
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
}
