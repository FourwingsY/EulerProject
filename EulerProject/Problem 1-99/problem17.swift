//
//  problem17.swift
//  EulerProject
//
//  Created by YG on 15/11/24.
//  Copyright © 2015 YG. All rights reserved.
//

func problem17(n: Int) -> Int {
    return (1...n).map {
        numberToWord($0).characters.count
    }.reduce(0, combine: (+))
}

let numberToWordDict = [
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
    10: "ten",
    11: "eleven",
    12: "twelve",
    13: "thirteen",
    14: "fourteen",
    15: "fifteen",
    16: "sixteen",
    17: "seventeen",
    18: "eighteen",
    19: "nineteen",
    20: "twenty",
    30: "thrity",
    40: "forty",
    50: "fifty",
    60: "sixty",
    70: "seventy",
    80: "eighty",
    90: "ninety",
    100: "hundred",
    1000: "thousand"
]

func numberToWord(n: Int) -> String {
    if n == 0 {
        return ""
    }
    var word = ""
    let thousands = n / 1000
    if thousands > 0 {
        let remain = n - thousands * 1000
        word = numberToWordDict[thousands]! + numberToWordDict[1000]!
        if remain > 0 {
            word += numberToWord(remain)
        }
        return word
    }
    
    let hundreds = n / 100
    if hundreds > 0 {
        let remain = n - hundreds * 100
        word = numberToWordDict[hundreds]! + numberToWordDict[100]!
        if remain > 0 {
            word += "and" + numberToWord(remain)
        }
        return word
    }
    
    // 1 - 99
    if let remainWord = numberToWordDict[n] {
        word = remainWord
    } else {
        let tens = (n / 10) * 10
        let ones = n % 10
        word += numberToWordDict[tens]! + numberToWordDict[ones]!
    }
    
    return word
}
