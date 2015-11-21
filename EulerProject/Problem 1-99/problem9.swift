//
//  problem9.swift
//  EulerProject
//
//  Created by YG on 11/21/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem9(sum: Int) -> Int {
    let triples = (1..<sum/3).map {
        a in
        ((a+1)..<sum-a).map {
            b in
            (a, b, sum-a-b)
        }
    }.reduce([], combine: (+))
    let result = triples.filter {
        ($0.0 + $0.1 > $0.2) && (($0.0 ^^ 2) + ($0.1 ^^ 2) == ($0.2 ^^ 2))
    }
    let resultTriple = result[0]

    return resultTriple.0 * resultTriple.1 * resultTriple.2
}