//
//  problem15.swift
//  EulerProject
//
//  Created by YG on 11/22/15.
//  Copyright © 2015 YG. All rights reserved.
//

import Darwin

func problem15(x: Int, y: Int) -> Int {
    let ln_result: Double = ln_factorial(x+y) - ln_factorial(x) - ln_factorial(y)
    return Int(exp(ln_result))
}

func ln_factorial(n: Int) -> Double {
    return (1...n).reduce(0) {
        $0 + log(Double($1))
    }
}