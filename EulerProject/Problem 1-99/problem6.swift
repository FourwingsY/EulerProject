//
//  problem6.swift
//  EulerProject
//
//  Created by YG on 11/19/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem6(n: Int) -> Int {
    let sumOfSquare = (1...n).map {$0 ^^ 2}
        .reduce(0, combine: (+))
    let squareOfSum = (1...n).reduce(0, combine: (+)) ^^ 2
    return squareOfSum - sumOfSquare
}