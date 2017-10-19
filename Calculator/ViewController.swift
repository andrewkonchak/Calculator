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
            if let resultValue = result {
                self.outputInterface?.display("\(resultValue)")
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
        }
    }
    
}

