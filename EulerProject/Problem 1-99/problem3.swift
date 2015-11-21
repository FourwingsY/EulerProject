//
//  problem3.swift
//  EulerProject
//
//  Created by YG on 11/18/15.
//  Copyright © 2015 YG. All rights reserved.
//

func problem3(n: Int) -> Int {
    return n.primeFactor.maxElement()!
}