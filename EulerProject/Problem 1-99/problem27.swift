//
//  problem27.swift
//  EulerProject
//
//  Created by YG on 15/12/2.
//  Copyright © 2015 YG. All rights reserved.
//

func problem27() -> Int {
    // formula(n) == n*n + a*n + b
    // formula(0) == b : should be Prime
    // formula(1) == 1 + a + b : should be Prime and Positive
    let bs = Prime().takeWhile { $0 < 1000 }
    let coefficients = bs.map {
        b in
        ((-b)..<1000).map {
            a in
            (a,b)
        }
    }.reduce([], combine: (+))
    
    var max = 0
    var result: (a: Int, b: Int) = (0,0)
    for (a,b) in coefficients {
        // can go over maximum case?
        let formula = createFormula(a,b)
        if formula(max) < 0 {
            continue
        }
        let count = testFormula(formula)
        if count > max {
            max = count
            result = (a,b)
        }
    }
    return result.a * result.b
}

func createFormula(a: Int, _ b: Int) -> Int -> Int {
    return {
        n in
        n * n + a * n + b
    }
}

func testFormula(formula: Int -> Int) -> Int {
    var count = 0
    for i in (0..<1000) {
        let value = formula(i)
        if (value < 0) {
            return count
        }
        if (value.isPrime) {
            count++
        } else {
            return count
        }
    }
    return count
}