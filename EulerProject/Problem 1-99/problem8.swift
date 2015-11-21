//
//  problem8.swift
//  EulerProject
//
//  Created by YG on 11/21/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem8(n: Int) -> Int {
    let numbers = readFile("Data/data8.txt").characters.map {
        Int(String($0))!
    }
    return (0..<(numbers.count - n)).map {
        i in
        numbers[i..<i+n].reduce(1){$0*$1}
    }.maxElement()!
}