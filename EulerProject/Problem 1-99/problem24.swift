//
//  problem24.swift
//  EulerProject
//
//  Created by YG on 15/11/27.
//  Copyright © 2015 YG. All rights reserved.
//

func problem24(n: Int) -> Int {
    let permutation = nthLexicographicPermutation(n-1, set: [0,1,2,3,4,5,6,7,8,9])
    let stringified = permutation
        .map {String($0)}
        .reduce("", combine: (+))
    return Int(stringified)!
}

func nthLexicographicPermutation(n: Int, set: [Int]) -> [Int] {
    // assume set is sorted already
    if (set.count == 0) {
        return []
    }
    if (n >= factorial(set.count)) {
        return []
    }
    let firstIdx = n / factorial(set.count - 1)
    let firstElement = set[firstIdx]
    let restN = n - (firstIdx * factorial(set.count - 1))
    let restSet = set.filter {$0 != firstElement}
    return [firstElement] + nthLexicographicPermutation(restN, set: restSet)
}

func factorial(n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    return n * factorial(n-1)
}