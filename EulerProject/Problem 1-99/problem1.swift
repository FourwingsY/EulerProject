//
//  problem1.swift
//  EulerProject
//
//  Created by YG on 11/18/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem1(n: Int, multiplesOf: [Int]) -> Int {
    return (1..<n).filter {
        num in
        return multiplesOf.contains {
            num % $0 == 0
        }
    }.reduce(0, combine: (+))
}