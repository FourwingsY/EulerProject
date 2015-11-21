//
//  problem4.swift
//  EulerProject
//
//  Created by YG on 11/18/15.
//  Copyright © 2015 YG. All rights reserved.
//

import Foundation

func problem4(digits: Int) -> Int {
    let max = (10 ^^ digits) - 1

    let a = (1...max).map {
        a in
        return (a...max)
            .filter {b in isPalindrome(a * b)}
            .map {b in (a*b, a, b)}
    }.flatten()
    let maxElement = a.maxElement {$0.0.0 < $0.1.0}!
    return maxElement.0
}

func isPalindrome(word: String) -> Bool {
    return !Zip2Sequence(word.characters, word.characters.reverse())
        .contains {$0.0 != $0.1}
}
func isPalindrome(n: Int) -> Bool {
    return isPalindrome(String(n))
}

infix operator ^^ { }
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}
