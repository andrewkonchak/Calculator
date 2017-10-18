//
//  InputViewController.swift
//  Calculator
//
//  Created by Andrew on 10/9/17.
//  Copyright © 2017 Andrew. All rights reserved.
//

import UIKit
import AVFoundation

class InputViewController: UIViewController, InputInterface {
    
    weak var delegate: InputInterfaceDelegate?

    func playClick() {
        AudioServicesPlaySystemSound(1103)
    }
    
    @IBAction func symbolPressed(_ sender: UIButton) {
        delegate?.symbolPressed(sender.currentTitle!)
        playClick()
        
    }
        
}

