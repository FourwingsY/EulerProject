//
//  Int.swift
//  EulerProject
//
//  Created by YG on 11/21/15.
//  Copyright © 2015 YG. All rights reserved.
//

import Foundation

infix operator ^^ { }
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}


struct BigInt: CustomStringConvertible {
    let dividor = 1_000_000_000_000
    var decimal: [Int] = [0]
    init(n: Int) {
        decimal = [n]
    }
    mutating func apply(calculate: Int -> Int) {
        var calculated = self.decimal.map(calculate)
        for i in (0..<calculated.count) {
            if calculated[i] > dividor {
                let quotient = calculated[i] / dividor
                let remainder = calculated[i] % dividor
                calculated[i] = remainder
                calculated[i+1] += quotient
            }
        }
        if calculated.last! != 0 {
            calculated.append(0)
        }
        decimal = calculated
        print(decimal)
    }
    var description: String {
        return decimal
            .dropLast()
            .map {
                n in
                if (n == 0) {
                    return "000000000000"
                } else {
                    return String(n)
                }
            }
            .reverse()
            .reduce("", combine: (+))
        
    }
}
