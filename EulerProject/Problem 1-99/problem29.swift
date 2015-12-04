//
//  problem29.swift
//  EulerProject
//
//  Created by YG on 15/12/3.
//  Copyright © 2015 YG. All rights reserved.
//

func problem29() -> Int {
    var set: Set<String> = Set()
    for a in (2...100) {
        for b in (2...100) {
            print(a,b)
            set.insert(String(repeatArray(a.primeFactor, count: b).sort()))
        }
    }
    return set.count
}

func repeatArray(arr: [Int], count: Int) -> [Int] {
    if count == 1 {
        return arr
    }
    return arr + repeatArray(arr, count: count - 1)
}