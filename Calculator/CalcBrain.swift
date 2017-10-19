//
//  CalcBrain.swift
//  Calculator
//
//  Created by Andrew on 10/13/17.
//  Copyright © 2017 Andrew. All rights reserved.
//

import UIKit

enum Operation: String {
    case plus  = "+"
    case minus = "-"
    case mult  = "x"
    case div   = "/"
    case exp   = "^"
    case equal = "="
}

enum Function: String {
    case sqrt    = "√"
    case sin     = "sin"
    case cos     = "cos"
    case tan     = "tan"
    case sinh    = "sinh"
    case cosh    = "cosh"
    case tanh    = "tanh"
    case ln      = "ln"
    case log     = "log"
    case fact    = "x!"
    case percent = "%"
    case sign    = "+/-"
}

enum Memory: String {
    case memoryClean  = "mc"
    case memoryAdd    = "m+"
    case memoryRemove = "m-"
    case clean        = "C"
    case allClean     = "AC"
}

enum Utility: String {
    case dot          = "."
    case leftBracket  = "("
    case rightBracket = ")"
}

enum Constants: String {
    case pi = "π"
    case e  = "e"
}

// MARK : CalculatorInterface + InputInterfaceDelegate

class CalcBrain: CalculatorInterface {
    func digit(_ value: Double) {
    }
    
    func operation(_ operation: Operation) {
        resultClosure?(123.123, nil)
    }
    
    func function(_ function: Function) {
    }
    
    func memory(_ memory: Memory) {
    }
    
    func utility(_ utility: Utility) {
    }
    
    func constants(_ constants: Constants) {
      
    }
    
    var resultClosure: ((Double?, Error?) -> Void)?
}
