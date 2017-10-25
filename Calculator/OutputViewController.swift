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
            displayLabel.textColor = .white
            displayLabel.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        case .grey:
            displayLabel.textColor = .white
            displayLabel.backgroundColor = .black
        case .black:
            displayLabel.textColor = .black
            displayLabel.backgroundColor = .white
        }
    }
    
    func display(_ result: String) {
        displayLabel.text = result
    }
}
