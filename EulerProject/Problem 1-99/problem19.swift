//
//  problem19.swift
//  EulerProject
//
//  Created by YG on 15/11/24.
//  Copyright © 2015 YG. All rights reserved.
//

func problem19(start: Date, end: Date) -> Int {
    var d = start
    var count = 0
    while d != end {
        d = d.tomorrow()
        if d.date == 1 && d.day == .Sun {
            count++
            print("\(d.year) : \(count)")
        }
    }
    return count
}

