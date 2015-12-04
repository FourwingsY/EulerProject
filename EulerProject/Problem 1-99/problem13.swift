//
//  problem13.swift
//  EulerProject
//
//  Created by YG on 11/22/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem13() -> String {
    let numbers = readFile("Data/data13.txt")
        .componentsSeparatedByString("\n")
        .map {
            Int($0.substringToIndex($0.startIndex.advancedBy(12)))!
        }
    let result = String(numbers.reduce(0, combine: (+)))
    return result.substringToIndex(result.startIndex.advancedBy(10))
}