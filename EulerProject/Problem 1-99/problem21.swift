//
//  problem21.swift
//  EulerProject
//
//  Created by YG on 15/11/26.
//  Copyright © 2015 YG. All rights reserved.
//

func problem21(limit: Int) -> Int {
    let properDivisorSum = (2...limit).map {($0, $0.properDivisors.reduce(0, combine: (+)))}
    let properDivisorSumDict = tupleToDict(properDivisorSum)
    
    let amicableNumbers = (2...limit).filter {
        num in
        let amica = properDivisorSumDict[num]!
        if (num == amica) {
            // it's perfect number,
            // not amicable number
            return false
        }

        if let amicaamica = properDivisorSumDict[amica] {
            return num == amicaamica
        }
        return false
    }
    
    return amicableNumbers.reduce(0, combine: (+))
}

func tupleToDict<T: Hashable, U>(tuples: [(T, U)]) -> [T:U] {
    var dict: [T:U] = [:]
    for tuple in tuples {
        dict[tuple.0] = tuple.1
    }
    return dict
}