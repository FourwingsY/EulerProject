//
//  problem12.swift
//  EulerProject
//
//  Created by YG on 11/21/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem12(limit: Int) -> Int {
    return TriangularNumber().findOne {divisorCount($0!) > limit}!
}

class TriangularNumber : SequenceType {
    typealias Element = Int
    func generate() -> AnyGenerator<Element> {
        var n = 1
        var num = 0
        return anyGenerator({
            num += n
            n++
            return num
        })
    }
}

func divisorCount(n: Int) -> Int {
    let factors = n.primeFactor
            .groupBy{$0}
            .map {($0.0, $0.1.count)}
    return factors.map {
        $0.1 + 1
    }.reduce(1) {$0 * $1}
}