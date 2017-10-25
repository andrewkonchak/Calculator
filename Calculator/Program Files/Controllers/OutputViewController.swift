//
//  OutputViewController.swift
//  Calculator
//
//  Created by Andrew on 10/11/17.
//  Copyright © 2017 Andrew. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController, OutputInterface {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.adjustsFontSizeToFitWidth = true
        displayLabel.minimumScaleFactor = 0.5
        displayLabel.lineBreakMode = .byTruncatingHead
    }
    
    func themeChanged(theme: Theme) {
        switch theme {
        case .red:
            displayLabel.textColor = #colorLiteral(red: 0.839222014, green: 0.8486475945, blue: 0.8966010213, alpha: 1)
            displayLabel.backgroundColor = #colorLiteral(red: 0.2042686343, green: 0.2187210023, blue: 0.4076853991, alpha: 1)
        case .grey:
            displayLabel.textColor = .white 
            displayLabel.backgroundColor = .black
        case .black:
            displayLabel.textColor = #colorLiteral(red: 0.8744425178, green: 0.8745476604, blue: 0.8744066358, alpha: 1)
            displayLabel.backgroundColor = #colorLiteral(red: 0.09410684556, green: 0.09412372857, blue: 0.09410110861, alpha: 1)
        }
    }
    
    func display(_ result: String) {
        displayLabel.text = result
    }
}
