//
//  Fibonacci.swift
//  EulerProject
//
//  Created by YG on 11/18/15.
//  Copyright © 2015 YG. All rights reserved.
//

struct Fibonacci : SequenceType {
    typealias Element = Int
    func generate() -> AnyGenerator<Element> {
        var lastTwo = (0, 1)
        return anyGenerator({
            lastTwo = (lastTwo.1, lastTwo.0 + lastTwo.1)
            return lastTwo.1
        })
    }
}
