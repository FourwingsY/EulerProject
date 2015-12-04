//
//  problem18.swift
//  EulerProject
//
//  Created by YG on 15/11/24.
//  Copyright © 2015 YG. All rights reserved.
//

func problem18() -> Int {
    let numbers = readFile("Data/data18.txt")
        .componentsSeparatedByString("\n").map {
        $0.componentsSeparatedByString(" ").map {
            Int($0)!
        }
    }.reverse()
    let height = numbers.count
    
    func fold(a: [Int], b: [Int]) -> [Int] {
        return (0..<(b.count)).map {
            b[$0] + max(a[$0], a[$0+1])
        }
    }
    
    let foldNumbers = numbers.dropFirst().reduce(numbers.first!, combine: fold)
    return foldNumbers.first!
}
