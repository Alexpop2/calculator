//
//  Calculator.swift
//  Calculator
//
//  Created by Рабочий on 02/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import Foundation

enum CalculatorConditions {
    case firstNumberEnter
    case secondNumberEnter
    case ready
    case equalResult
}

enum CalculatorOperations {
    case none
    case addition
    case subtraction
    case division
    case multiplication
}

class Calculator {
    private var firstNumber: Decimal
    private var secondNumber: Decimal
    private var condition: CalculatorConditions
    private var operation: CalculatorOperations
    private var komma: Bool
    
    init() {
        firstNumber = 0
        secondNumber = 0
        operation = CalculatorOperations.none
        condition = CalculatorConditions.ready
        komma = false
    }
    
    func insertNumber(num: String) -> String {
        guard let numDecimal = Decimal(string: num) else {
            return "Ошибка"
        }
        switch condition {
        case .firstNumberEnter:
            if(firstNumber < 9999999999 || firstNumber > -999999999) {
                if(!komma) {
                    firstNumber = firstNumber * 10 + numDecimal
                }
                else {
                    firstNumber += numDecimal / 10
                }
            }
            return "\(firstNumber)"
        case .secondNumberEnter:
            if(secondNumber < 9999999999 || secondNumber > -999999999) {
                if(!komma) {
                    secondNumber = secondNumber * 10 + numDecimal
                }
                else {
                    secondNumber += numDecimal / 10
                }
            }
            return "\(secondNumber)"
        case .ready:
            if(num == "0") {
                return num
            }
            firstNumber = numDecimal
            condition = .firstNumberEnter
            return "\(firstNumber)"
        case .equalResult:
            _ = ac()
            return insertNumber(num: num)
        }
    }
    
    func insertKomma() -> String {
        switch condition {
        case .firstNumberEnter:
            if(firstNumber.exponent == 0 && (firstNumber < 9999999999
                || firstNumber > -999999999)) {
                komma = true
                return "\(firstNumber),"
            }
            return "\(firstNumber)"
        case .secondNumberEnter:
            if(secondNumber.exponent == 0 && (secondNumber < 9999999999
                || secondNumber > -999999999)) {
                komma = true
                return "\(secondNumber),"
            }
            return "\(secondNumber)"
        case .ready:
            komma = true
            condition = .firstNumberEnter
            return "\(firstNumber),"
        case .equalResult:
            _ = ac()
            return insertKomma()
        }
    }
    
    func unary() -> String {
        switch condition {
        case .firstNumberEnter:
            firstNumber = -firstNumber
            return "\(firstNumber)"
        case .secondNumberEnter:
            secondNumber = -secondNumber
            return "\(secondNumber)"
        case .ready:
            condition = .firstNumberEnter
            return "\(firstNumber)"
        case .equalResult:
            condition = .firstNumberEnter
            secondNumber = 0
            return unary()
        }
    }
    
    func procent() -> String {
        switch condition {
        case .firstNumberEnter:
            secondNumber = 100
            operation = .division
            return equal()
        case .secondNumberEnter:
            firstNumber = secondNumber
            secondNumber = 100
            operation = .division
            return equal()
        case .ready:
            return "\(firstNumber)"
        case .equalResult:
            condition = .firstNumberEnter
            return procent()
        }
    }
    
    func ac() -> String {
        firstNumber = 0
        secondNumber = 0
        operation = CalculatorOperations.none
        condition = CalculatorConditions.ready
        komma = false
        return "\(firstNumber)"
    }
    
    func operate(type: CalculatorOperations) -> String {
        operation = type
        switch condition {
        case .firstNumberEnter:
            condition = .secondNumberEnter
            return "\(firstNumber)"
        case .secondNumberEnter:
            let result = equal()
            condition = .secondNumberEnter
            return result
        case .ready:
            if(operation == .subtraction) {
                condition = .secondNumberEnter
            }
            return firstNumber
        case .equalResult:
            condition = .secondNumberEnter
            secondNumber = 0
            return "\(firstNumber)"
        }
    }
    
    func equal() -> String {
        switch operation {
        case .none:
            return "\(firstNumber)"
        case .multiplication:
            firstNumber = firstNumber * secondNumber
            condition = .equalResult
        case .addition:
            firstNumber = firstNumber + secondNumber
            condition = .equalResult
        case .division:
            firstNumber = firstNumber / secondNumber
            condition = .equalResult
        case .subtraction:
            firstNumber = firstNumber - secondNumber
            condition = .equalResult
        }
        return "\(firstNumber)"
    }
}
