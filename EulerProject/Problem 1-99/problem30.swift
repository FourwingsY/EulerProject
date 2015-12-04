//
//  problem30.swift
//  EulerProject
//
//  Created by YG on 15/12/3.
//  Copyright © 2015 YG. All rights reserved.
//

func problem30() -> Int {
    let result = (10...350000).filter {
        number in
        if number % 1000 == 0 {
            print(number)
        }
        return isFifthPowerSum(number)
    }
    return result.reduce(0, combine: (+))
}

let fifthPowers = tupleToDict((0...9).map {($0, $0 ^^ 5)})

func isFifthPowerSum(n: Int) -> Bool {
    let stringNum = String(n).characters.map {
        Int(String($0))!
    }
    var total = 0
    for i in stringNum {
        total += fifthPowers[i]!
    }
    return total == n
}