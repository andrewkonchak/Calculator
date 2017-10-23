//
//  OutputViewController.swift
//  Calculator
//
//  Created by Andrew on 10/11/17.
//  Copyright © 2017 Andrew. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController, OutputInterface {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.minimumScaleFactor = 0.5
        displayLabel.lineBreakMode = .byTruncatingHead
    }
    
    func display(_ result: String) {
        displayLabel.text = result
    }
    
    @IBOutlet weak var displayLabel: UILabel!
}
