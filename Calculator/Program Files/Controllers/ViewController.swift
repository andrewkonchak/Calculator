//
//  ViewController.swift
//  Calculator
//
//  Created by Andrew on 10/9/17.
//  Copyright © 2017 Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, InputInterfaceDelegate {
    
    var outputInterface: OutputInterface?
    var inputInterface: InputInterface?
    var calcBrain = CalcBrain()
    
    @IBOutlet weak var selectedThemeButton: UIButton!
    @IBOutlet weak var redThemeButton: UIButton!
    @IBOutlet weak var greyThemeButton: UIButton!
    @IBOutlet weak var blackThemeButton: UIButton!
    @IBOutlet weak var themeView: UIView!
    
    @IBOutlet weak var redThemeLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var greyThemeLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var blackThemeLeftConstraint: NSLayoutConstraint!
    
    var themeViewIsExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedThemeButton.layer.cornerRadius = selectedThemeButton.frame.size.height / 2
        redThemeButton.layer.cornerRadius = redThemeButton.frame.size.height / 2
        greyThemeButton.layer.cornerRadius = greyThemeButton.frame.size.height / 2
        blackThemeButton.layer.cornerRadius = blackThemeButton.frame.size.height / 2
        
        selectedThemeButton.layer.borderWidth = 1.5
        redThemeButton.layer.borderWidth = 1.5
        greyThemeButton.layer.borderWidth = 1.5
        blackThemeButton.layer.borderWidth = 1.5
        
        redThemeButton.backgroundColor = .red
        greyThemeButton.backgroundColor = .gray
        blackThemeButton.backgroundColor = .black
        
        
        selectedThemeButton.layer.borderColor = UIColor.white.cgColor
        redThemeButton.layer.borderColor = UIColor.purple.cgColor
        greyThemeButton.layer.borderColor = UIColor.purple.cgColor
        blackThemeButton.layer.borderColor = UIColor.purple.cgColor
        
        animateThemeView(expand: false, animated: false, selectedColor: .gray)
        inputInterface?.themeChanged(theme: .grey)
        outputInterface?.themeChanged(theme: .grey)
        
        calcBrain.resultClosure = { result, error -> Void in
            if let resultString = result {
                self.outputInterface?.display(resultString)
            }
        }
        
    }
    
    func animateThemeView(expand: Bool, animated: Bool, selectedColor: UIColor?) {
        themeViewIsExpanded = expand
        
        if let color = selectedColor {
            selectedThemeButton.backgroundColor = color
        }
        
        if expand {
            self.redThemeLeftConstraint.constant = 38
            self.greyThemeLeftConstraint.constant = 76
            self.blackThemeLeftConstraint.constant = 114
            
            UIView.animate(withDuration: animated ? 0.7 : 0, animations: {
                self.themeView.layoutIfNeeded()
            })
        } else {
            self.redThemeLeftConstraint.constant = 0
            self.greyThemeLeftConstraint.constant = 0
            self.blackThemeLeftConstraint.constant = 0
            
            UIView.animate(withDuration: animated ? 0.7 : 0, animations: {
                self.themeView.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func selectedThemeAction(_ sender: UIButton) {
        animateThemeView(expand: !themeViewIsExpanded, animated: true, selectedColor: nil)
    }
    
    @IBAction func redThemeAction(_ sender: UIButton) {
        animateThemeView(expand: !themeViewIsExpanded, animated: true, selectedColor: sender.backgroundColor)
        inputInterface?.themeChanged(theme: .red)
        outputInterface?.themeChanged(theme: .red)
    }
    
    @IBAction func greyThemeAction(_ sender: UIButton) {
        animateThemeView(expand: !themeViewIsExpanded, animated: true, selectedColor: sender.backgroundColor)
        inputInterface?.themeChanged(theme: .grey)
        outputInterface?.themeChanged(theme: .grey)
    }
    
    @IBAction func blackThemeAction(_ sender: UIButton) {
        animateThemeView(expand: !themeViewIsExpanded, animated: true, selectedColor: sender.backgroundColor)
        inputInterface?.themeChanged(theme: .black)
        outputInterface?.themeChanged(theme: .black)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerSegue" {
            outputInterface = segue.destination as? OutputInterface
        } else if segue.identifier == "InputControllerSegue" {
            inputInterface = segue.destination as? InputInterface
            inputInterface?.delegate = self
        }
    }
    
    func symbolPressed(_ symbol: String) {
        if symbol == Operation.equal.rawValue {
            calcBrain.operation(.equal)
        } else if symbol == Operation.plus.rawValue {
            calcBrain.operation(.plus)
        } else if symbol == Operation.minus.rawValue {
            calcBrain.operation(.minus)
        } else if symbol == Operation.mult.rawValue {
            calcBrain.operation(.mult)
        } else if symbol == Operation.div.rawValue {
            calcBrain.operation(.div)
        } else if symbol == Operation.exp.rawValue {
                calcBrain.operation(.exp)
        } else if symbol == Function.sqrt.rawValue {
            calcBrain.function(.sqrt)
        } else if symbol == Function.sin.rawValue {
            calcBrain.function(.sin)
        } else if symbol == Function.cos.rawValue {
            calcBrain.function(.cos)
        } else if symbol == Function.square.rawValue {
            calcBrain.function(.square)
        } else if symbol == Function.tan.rawValue {
            calcBrain.function(.tan)
        } else if symbol == Function.sinh.rawValue {
            calcBrain.function(.sinh)
        } else if symbol == Function.cosh.rawValue {
            calcBrain.function(.cosh)
        } else if symbol == Function.tanh.rawValue {
            calcBrain.function(.tanh)
        } else if symbol == Function.ln.rawValue {
            calcBrain.function(.ln)
        } else if symbol == Function.percent.rawValue {
            calcBrain.function(.percent)
        } else if symbol == Function.sign.rawValue {
            calcBrain.function(.sign)
        } else if symbol == Memory.clean.rawValue {
            calcBrain.memory(.clean)
        } else if symbol == Utility.dot.rawValue {
            calcBrain.utility(.dot)
        } else if symbol == Constants.pi.rawValue {
            calcBrain.constants(.pi)
        } else if symbol == Constants.e.rawValue {
            calcBrain.constants(.e)
        } else if symbol == Random.rand.rawValue {
            calcBrain.random(.rand)
        } else if let value = Int(symbol) {
            calcBrain.digit(value)
        }
        
    }
    
}

