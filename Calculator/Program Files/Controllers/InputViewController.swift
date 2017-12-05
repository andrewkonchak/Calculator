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
                button.backgroundColor = #colorLiteral(red: 0.9418521523, green: 0.3477120399, blue: 0.3373567164, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            }
            
            for button in mainOperationButtons {
                button.backgroundColor = #colorLiteral(red: 0.9025143981, green: 0.2611960769, blue: 0.2626220584, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            }
        case .grey:
            for button in basicButtons {
                button.backgroundColor = #colorLiteral(red: 0.7789977929, green: 0.7817359264, blue: 0.7899503269, alpha: 1)
                button.setTitleColor(.black, for: .normal)
            }
            
            for button in mainOperationButtons {
                button.backgroundColor = #colorLiteral(red: 0.9539791942, green: 0.4415323734, blue: 0.2471605241, alpha: 1)
                button.setTitleColor(.black, for: .normal)
            }
        case .black:
            for button in basicButtons {
                button.backgroundColor = #colorLiteral(red: 0.1490048468, green: 0.1490279436, blue: 0.1489969492, alpha: 1)
                button.setTitleColor(#colorLiteral(red: 0.5528970957, green: 0.552965939, blue: 0.5528736711, alpha: 1), for: .normal)
            }
            
            for button in mainOperationButtons {
                button.backgroundColor = #colorLiteral(red: 0.9856122614, green: 1, blue: 0.7326840255, alpha: 1)
                button.setTitleColor(.black, for: .normal)
            }

        }
    }
    
    func playClick() {
        AudioServicesPlaySystemSound(1104)
    }
    
    @IBAction func symbolPressed(_ sender: UIButton) {
        delegate?.symbolPressed(sender.currentTitle!)
        playClick()
        sender.flash()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AdvancedInputSegue", var advancedInput = segue.destination as? InputInterface {
            advancedInput.delegate = delegate
        }
    }
}

