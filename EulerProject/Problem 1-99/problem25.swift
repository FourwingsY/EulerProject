//
//  problem25.swift
//  EulerProject
//
//  Created by YG on 15/11/27.
//  Copyright © 2015 YG. All rights reserved.
//

func problem25(digits: Int) -> Int {
    var n = 1
    while log10_fibonacci(n) < Double(digits-1) {
        n++
    }
    return n
}