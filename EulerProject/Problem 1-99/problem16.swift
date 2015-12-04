//
//  problem16.swift
//  EulerProject
//
//  Created by YG on 11/22/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem16(power: Int) -> Int {
    var number = BigInt(n: 1)
    (0..<power).forEach {_ in 
        number.apply {$0 * 2}
    }

    let digits = number.description.characters.map {
        Int(String($0))!
    }
    return digits.reduce(0) {$0 + $1}
}
