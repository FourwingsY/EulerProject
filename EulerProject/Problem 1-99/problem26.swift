//
//  problem26.swift
//  EulerProject
//
//  Created by YG on 15/11/29.
//  Copyright © 2015 YG. All rights reserved.
//

func problem26(limit: Int) -> Int {
    let repeatingDecimalLengths = (1...limit)
        .map {($0, repeatingDecimalLength($0))}
    return repeatingDecimalLengths.maxElement { $0.1 < $1.1 }!.0
}

func repeatingDecimalLength(n: Int) -> Int {
    let number = n.primeFactor.filter {$0 != 2 && $0 != 5}.reduce(1, combine: (*))
    var i = 1
    var mod = 10 % number
    while (mod > 1) {
        mod = (10 * mod) % number
        i++
    }
    if mod == 0 {
        return mod
    }
    return i
}