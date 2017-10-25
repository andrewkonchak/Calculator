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
    
    @IBOutlet var basicButtons: [UIButton]!
    @IBOutlet var mainOperationButtons: [UIButton]!
    
    weak var delegate: InputInterfaceDelegate?
    
    func symbolPressed(_ symbol: String) {
        delegate?.symbolPressed(symbol)
    }
    
    func themeChanged(theme: Theme) {
        switch theme {
        case .red:
            for button in basicButtons {
                button.backgroundColor = #colorLiteral(red: 0.950333178, green: 0.3766738176, blue: 0.3466693163, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 1, green: 0.8134765202, blue: 0.855745396, alpha: 1), for: .normal)
            }
            
            for button in mainOperationButtons {
                button.backgroundColor = .red
                button.setTitleColor(.black, for: .normal)
            }
        case .grey:
            for button in basicButtons {
                button.backgroundColor = .gray
                button.setTitleColor(.white, for: .normal)
            }
            
            for button in mainOperationButtons {
                button.backgroundColor = .gray
                button.setTitleColor(.white, for: .normal)
            }
        case .black:
            for button in basicButtons {
                button.backgroundColor = .black
                button.setTitleColor(.white, for: .normal)
            }
            
            for button in mainOperationButtons {
                button.backgroundColor = .black
                button.setTitleColor(.white, for: .normal)
            }

        }
    }
    
    func playClick() {
        AudioServicesPlaySystemSound(1103)
    }
    
    @IBAction func symbolPressed(_ sender: UIButton) {
        delegate?.symbolPressed(sender.currentTitle!)
        playClick()
        sender.shake()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AdvancedInputSegue", var advancedInput = segue.destination as? InputInterface {
            advancedInput.delegate = delegate
        }
    }
}

