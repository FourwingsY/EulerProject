//
//  problem23.swift
//  EulerProject
//
//  Created by YG on 15/11/27.
//  Copyright © 2015 YG. All rights reserved.
//

func problem23() -> Int {
    let maximumAbundantSum = 28123
    let properDivisorSum = (2..<maximumAbundantSum).map {($0, $0.properDivisors.reduce(0, combine: (+)))}
    
    let abundantNumbers = properDivisorSum
        .filter {$0.0 < $0.1}
        .map {$0.0}
    let abundantNumberSet = Set<Int>(abundantNumbers)
    
    let numbers = (1...maximumAbundantSum).filter {
        number in
        let candidates = abundantNumbers.takeWhile {$0! <= (number / 2) }
        return !candidates.contains {
            abundantNumberSet.contains(number - $0)
        }
    }
    return numbers.reduce(0, combine: (+))
}
