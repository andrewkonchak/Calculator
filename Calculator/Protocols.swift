//
//  Protocols.swift
//  Calculator
//
//  Created by Andrew on 10/13/17.
//  Copyright © 2017 Andrew. All rights reserved.
//

import Foundation

// MARK: - Protocols

protocol InputInterface {
    var delegate: InputInterfaceDelegate? { get set }
}

protocol OutputInterface {
    func display(_ result: String)
    
}

protocol InputInterfaceDelegate: class {
    func symbolPressed(_ symbol: String)
}


protocol CalculatorInterface {
    func digit(_ value: Double)
    func operation(_ operation: Operation)
    func function(_ function: Function)
    func memory(_ memory: Memory)
    func utility(_ utility: Utility)
    var resultClosure: ((Double?, Error?) -> Void)? { get set }
}
