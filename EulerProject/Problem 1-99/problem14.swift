//
//  problem14.swift
//  EulerProject
//
//  Created by YG on 11/22/15.
//  Copyright © 2015 YG. All rights reserved.
//

var collatz = [1:1, 2:2]

func problem14(limit: Int) -> Int {
    for n in (3..<limit) {
        if let _ = collatz[n] {
            continue
        }
        collatz[n] = getCollatzChainLength(n)
    }
    return collatz
        .filter {$0.1 < limit}
        .maxElement {$0.1 < $1.1}!.0
}

func getCollatzChainLength(n: Int) -> Int {
    if let saved = collatz[n] {
        return saved
    }
    return 1 + getCollatzChainLength(nextCollatz(n))
}

func nextCollatz(n: Int) -> Int {
    if n % 2 == 0 {
        return n / 2
    }
    return 3*n + 1
}