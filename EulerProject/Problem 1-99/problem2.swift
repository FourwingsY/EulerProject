//
//  problem2.swift
//  EulerProject
//
//  Created by YG on 11/18/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem2(limit: Int) -> Int {
    return Fibonacci().lazy
        .takeWhile { $0 < limit }
        .filter { $0 % 2 == 0 }
        .reduce(0, combine: (+))
}
