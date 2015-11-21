//
//  problem5.swift
//  EulerProject
//
//  Created by YG on 11/19/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem5(n: Int) -> Int {
    let factors = (2...n).map {
        number in
        number.primeFactor
            .groupBy{$0}
            .map {($0.0, $0.1.count)}
    }
    return factors.flatten().groupBy {
        $0.0
        }.map {
            ($0.0, $0.1.maxElement {$0.0.1 < $0.1.1}!.1)
        }.reduce(1) {
            $0 * ($1.0 ^^ $1.1)
    }
}