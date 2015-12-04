//
//  problem20.swift
//  EulerProject
//
//  Created by YG on 15/11/26.
//  Copyright © 2015 YG. All rights reserved.
//

func problem20(n: Int) -> Int {
    var number = BigInt(n: 1)
    (1...n).forEach {
        num in
        number.apply {$0 * num}
        print(number)
    }
    
    let digits = number.description.characters.map {
        Int(String($0))!
    }
    return digits.reduce(0) {$0 + $1}
}