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
    case mult  = "×"
    case div   = "÷"
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
    case square  = "x²"
    case percent = "%"
    case sign    = "+/-"
}

enum Memory: String {
    case memoryClean  = "mc"
    case memoryAdd    = "m+"
    case memoryRemove = "m-"
    case clean        = "☜"
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

enum Random: String {
    case rand = "Rand"
}

class CalcBrain: CalculatorInterface {
    
    var stillTyping = false
    var dotIsPlace = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSighn: Operation = .equal
    let formatter = NumberFormatter()
    var resultClosure: ((String?, Error?) -> Void)?
    
    var outputString = "0" {
        didSet {
           resultClosure?(outputString, nil)
        }
    }
    
    var currentInput: Double {
        get {
            return Double(outputString) ?? 0
        }
        set {
            outputString = formatter.string(for: newValue) ?? ""
            stillTyping = false
        }
    }
    
    init() {
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 5
    }
    
    private func operateWithTwoOperands(operations: (Double, Double) -> Double) {
        currentInput = operations(firstOperand, secondOperand)
        stillTyping = false
    }
    
    func digit(_ value: Int) {
        if stillTyping {
            outputString = outputString + "\(value)"
        } else {
            outputString = "\(value)"
            stillTyping = true
        }
    }
    
    func operation(_ operation: Operation) {
        switch operation {
        case .equal:
            if stillTyping {
                secondOperand = currentInput
            }
            
            dotIsPlace = false
            
            switch operationSighn {
            case .plus:
                operateWithTwoOperands{$0 + $1}
            case .minus:
                operateWithTwoOperands{$0 - $1}
            case .mult:
                operateWithTwoOperands{$0 * $1}
            case .div:
                operateWithTwoOperands{$0 / $1}
            case .exp:
                operateWithTwoOperands{pow($0, $1)}
            default: break
                
            }
        default:
            operationSighn = operation
            firstOperand = currentInput
            stillTyping = false
            dotIsPlace = false
        }
    }
    
    
    
    func function(_ function: Function) {
        switch function {
        case .sign:
            currentInput = -currentInput
        case .percent:
            if firstOperand == 0 {
                currentInput = currentInput / 100
            } else {
                secondOperand = firstOperand * currentInput / 100
            }
        case .sqrt:
            currentInput = sqrt(currentInput)
        case .sin:
            currentInput = sin(currentInput)
        case .cos:
            currentInput = cos(currentInput)
        case .tan:
            currentInput = tan(currentInput)
        case .sinh:
            currentInput = sinh(currentInput)
        case .cosh:
            currentInput = cosh(currentInput)
        case .tanh:
            currentInput = tanh(currentInput)
        case .ln:
            currentInput = log(currentInput)
        case .square:
            currentInput = pow(currentInput, 2)
        default:
            break
        }
    }
    
    func memory(_ memory: Memory) {
        switch memory {
        case .clean:
            firstOperand = 0
            secondOperand = 0
            currentInput = 0
            outputString = "0"
            stillTyping = false
            operationSighn = .equal
            dotIsPlace = false
        default:
            break
        }
    }
    
    func utility(_ utility: Utility) {
        switch utility {
        case .dot:
            if stillTyping && !dotIsPlace {
                outputString = outputString + "."
                dotIsPlace = true
            } else if !stillTyping && !dotIsPlace {
                outputString = "0."
            } 
        default:
            break
        }
    }
    
    func constants(_ constants: Constants) {
        switch constants {
        case .pi:
            let pi = formatter.string(for: Double.pi) ?? ""
            outputString = "\(pi)"
        case .e:
            let e = formatter.string(for: M_E) ?? ""
            outputString = "\(e)"
        }
        stillTyping = true
    }
    
    func random(_ random: Random) {
        switch random {
        case .rand:
            outputString = "\(arc4random_uniform(10000))"

        }

    }
}
