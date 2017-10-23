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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcBrain.resultClosure = { result, error -> Void in
            if let resultString = result {
                self.outputInterface?.display(resultString)
            }
        }
        
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
        } else if let value = Int(symbol) {
            calcBrain.digit(value)
        }
        
    }
    
}

