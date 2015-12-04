//
//  Fibonacci.swift
//  EulerProject
//
//  Created by YG on 11/18/15.
//  Copyright © 2015 YG. All rights reserved.
//

import Darwin

struct Fibonacci : SequenceType {
    typealias Element = Int
    func generate() -> AnyGenerator<Element> {
        var lastTwo = (0, 1)
        return anyGenerator({
            let result = lastTwo.1
            lastTwo = (lastTwo.1, lastTwo.0 + lastTwo.1)
            return result
        })
    }
}

func log10_fibonacci(n: Int) -> Double {
    let sqrt5: Double = sqrt(5)
    let goldenRatio = (1.0 + sqrt5) / 2
    return Double(n) * log10(goldenRatio) - log10(sqrt5)
}
