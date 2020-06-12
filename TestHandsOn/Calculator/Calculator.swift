//
//  Calculator.swift
//  testeClass
//
//  Created by Yuri on 09/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation

struct Calculator {
    static func divisionRemainder(of number: Int, dividedBy: Int) ->  (quotient: Int, remainder: Int) {
        let quotient = number / dividedBy
        let remainder = number % dividedBy
        
        return (quotient, remainder)
    }
}
