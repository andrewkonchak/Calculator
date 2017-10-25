//
//  Protocols.swift
//  Calculator
//
//  Created by Andrew on 10/13/17.
//  Copyright © 2017 Andrew. All rights reserved.
//

import Foundation

enum Theme {
    case red
    case grey
    case black
}

// MARK: - Protocols

protocol InputInterface {
    var delegate: InputInterfaceDelegate? { get set }
    func themeChanged(theme: Theme)
}

protocol OutputInterface {
    func display(_ result: String)
    func themeChanged(theme: Theme)
    
}

protocol InputInterfaceDelegate: class {
    func symbolPressed(_ symbol: String)
}


protocol CalculatorInterface {
    func digit(_ value: Int)
    func operation(_ operation: Operation)
    func function(_ function: Function)
    func memory(_ memory: Memory)
    func utility(_ utility: Utility)
    var resultClosure: ((String?, Error?) -> Void)? { get set }
}
