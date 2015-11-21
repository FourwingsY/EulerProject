//
//  problem10.swift
//  EulerProject
//
//  Created by YG on 11/21/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem10(limit: Int) -> Int {
    return Prime().takeWhile {$0 < limit}.reduce(0, combine: (+))
}