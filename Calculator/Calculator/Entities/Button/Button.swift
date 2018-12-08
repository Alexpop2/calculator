//
//  Button.swift
//  Calculator
//
//  Created by Рабочий on 06/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import Foundation

enum ButtonType {
    case num
    case ac
    case unary
    case procent
    case addition
    case subtraction
    case division
    case multiplication
    case equal
    case komma
}

class Button {
    let tag: Int
    let type: ButtonType
    var num: Int?
    
    init(tag: Int, type: ButtonType) {
        self.tag = tag
        self.type = type
    }
    
    init(tag: Int, num: Int) {
        self.tag = tag
        self.type = ButtonType.num
        self.num = num
    }
}
